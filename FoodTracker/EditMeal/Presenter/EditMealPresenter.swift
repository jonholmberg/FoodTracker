//
//  EditMealPresenter.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 14/09/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

import UIKit

class EditMealPresenter: NSObject, PresenterProtocol, EditMealPresenterProtocol {
    
    typealias Interactor = EditMealInteractorProtocol & InteractorProtocol
    typealias Router = RouterProtocol & EditMealRouterProtocol
    
    var router: Router
    var interactor: Interactor
    
    weak var delegate: EditMealPresenterDelegate?
    
    // TODO: Presenter should have its own view model.
    var meal: Meal? {
        get {
            return interactor.meal
        }
        set {
            interactor.meal = newValue
        }
    }

    init(interactor: Interactor, router: Router) {
        self.interactor = interactor
        self.router = router
    }
    
    func pressedSave(with meal: Meal) {
        interactor.meal = meal
    }
    
    func pressedImage() {
        router.showImagePicker(with: self)
    }
    
    func pressedCancel() {
//        let isPresentingInAddMealMode = presentingViewController is UINavigationController
//        if isPresentingInAddMealMode {
//            dismiss(animated: true, completion: nil)
//        } else if let owningNavigationController = navigationController {
//            owningNavigationController.popViewController(animated: true)
//        } else {
//            fatalError("The MealViewController is not inside a navigation controller.")
//        }
        router.back()
    }
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear(_ animated: Bool) {
        
    }
    
    func viewDidAppear(_ animated: Bool) {
        
    }
    
    func viewWillDisappear(_ animated: Bool) {
        
    }
    
    func viewDidDisappear(_ animated: Bool) {
        
    }
}

// TODO: Presenter should not know about UIKit. Implement a wrapper.
extension EditMealPresenter: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        router.dismissImagePicker()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            print("Selected image was nil")
            return
        }
        
        delegate?.setImageView(to: selectedImage)
        router.dismissImagePicker()
    }
}

extension EditMealPresenter: UINavigationControllerDelegate {
    
}
