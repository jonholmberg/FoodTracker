//
//  EditMealPresenter.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 14/09/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

class EditMealPresenter: PresenterProtocol, EditMealPresenterProtocol {
    typealias Interactor = EditMealInteractorProtocol & InteractorProtocol
    
    var interactor: Interactor
    var meal: Meal? {
        get {
            return interactor.meal
        }
        set {
            interactor.meal = newValue
        }
    }

    init(interactor: Interactor) {
        self.interactor = interactor
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
