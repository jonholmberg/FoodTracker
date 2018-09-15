//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 17/03/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController, UITextFieldDelegate, EditMealViewProtocol {

    typealias Presenter = PresenterProtocol & EditMealPresenterProtocol
    
    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var presenter: Presenter!
    
    // Default set to edit mode.
    var editMode: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
        // Setup VIPER
        let interactor = EditMealInteractor()
        let router = EditMealRouter(viewController: self)
        self.presenter = EditMealPresenter(interactor: interactor, router: router)
        self.presenter.delegate = self
        
        presenter.viewDidLoad()
        
        // Set up views if editing an existing Meal.
        if let meal = presenter.meal {
            navigationItem.title = meal.name
            nameTextField.text   = meal.name
            photoImageView.image = meal.photo
            ratingControl.rating = meal.rating
        }
        
        updateSaveButtonState()
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        
        presenter.pressedSave(with: Meal(name: name, photo: photo, rating: rating)!)
    }

    // MARK: Actions

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        presenter.pressedCancel()
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()
        
        presenter.pressedImage()
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    // MARK: Private methods
    
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

extension MealViewController: EditMealPresenterDelegate {
    func setImageView(to image: UIImage) {
        photoImageView.image = image
    }
}
