//
//  MealListPresenterProtocol.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 14/09/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

protocol MealListPresenterProtocol {
    var rows: [Meal] { get }
    
    func pressedMeal(at row: Int)
}
