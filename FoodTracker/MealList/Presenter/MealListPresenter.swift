//
//  MealListPresenter.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 14/09/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

class MealListPresenter<Interaction: InteractorProtocol & MealListInteractorProtocol>: PresenterProtocol, MealListPresenterProtocol {
    
    func pressedMeal(at row: Int) {
        
    }
    
    var rows: [Meal]
    
    var interactor: Interaction
    
    init(interactor: Interaction) {
        self.interactor = interactor
        
        rows = interactor.meals
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
