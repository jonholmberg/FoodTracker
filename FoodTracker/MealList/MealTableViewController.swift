//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 20/04/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

import UIKit
import os.log

class MealTableViewController: UITableViewController, EditMealViewProtocol {
    typealias Presenter = PresenterProtocol & MealListPresenterProtocol
    
    fileprivate let cellIdentifier = "MealTableViewCell"
    
    var presenter: Presenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        
        // TODO: Move to SwinjectStoryboard
        let mealListInteractor = MealListInteractor()
        self.presenter = MealListPresenter(interactor: mealListInteractor)
        
        presenter.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.rows.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        guard let mealCell = cell as? MealTableViewCell else {
            print("Cell not of type \(cellIdentifier)")
            return cell
        }
        
        let meal = presenter.rows[indexPath.row]
        
        mealCell.nameLabel.text = meal.name
        mealCell.photoImageVIew.image = meal.photo
        mealCell.ratingControl.rating = meal.rating

        // Configure the cell...

        return mealCell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // TODO: Add deletion of a row.

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let mealDetailViewController = segue.destination as? MealViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedMealCell = sender as? MealTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedMeal = presenter.rows[indexPath.row]
            mealDetailViewController.presenter.meal = selectedMeal
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    // MARK: Actions
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealViewController,
            let meal = sourceViewController.presenter.meal {
            
            // TODO: FIX
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                meals[selectedIndexPath.row] = meal
//                tableView.reloadRows(at: [selectedIndexPath], with: .none)
//            } else {
//                let newIndexPath = IndexPath(row: meals.count, section: 0)
//                meals.append(meal)
//                tableView.insertRows(at: [newIndexPath], with: .automatic)
//            }
        }
    }
}
