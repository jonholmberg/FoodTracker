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

extension EditMealPresenter: UIImagePickerControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            print("Selected image was nil")
            return
        }
        
//        photoImageView.image = selectedImage
//        dismiss(animated: true, completion: nil)
    }
}

extension EditMealPresenter: UINavigationControllerDelegate {
    
}
