//
//  EditMealPresenterProtocol.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 14/09/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

protocol EditMealPresenterProtocol {
    var interactor: InteractorProtocol & EditMealInteractorProtocol { get }
    var router: RouterProtocol & EditMealRouterProtocol { get }
    
    var delegate: EditMealPresenterDelegate? { get set }
    
    var meal: Meal? { get set }
    
    func pressedSave(with meal: Meal)
    func pressedImage()
    func pressedCancel()
}
