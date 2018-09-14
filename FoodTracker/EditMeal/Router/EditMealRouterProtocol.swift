//
//  EditMealRouterProtocol.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 14/09/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

import UIKit

protocol EditMealRouterProtocol {
        typealias ImagePickerDelgatee = UIImagePickerControllerDelegate & UINavigationControllerDelegate
    
    func showImagePicker(with delegate: ImagePickerDelgatee)
    func dismissImagePicker()
}
