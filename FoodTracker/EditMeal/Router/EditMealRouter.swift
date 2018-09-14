//
//  EditMealRouter.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 14/09/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

import UIKit

class EditMealRouter: RouterProtocol, EditMealRouterProtocol {
    var viewController: UIViewController

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showImagePicker(with delegate: ImagePickerDelgatee) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = delegate
   
        viewController.present(imagePickerController, animated: true, completion: nil)
    }
}
