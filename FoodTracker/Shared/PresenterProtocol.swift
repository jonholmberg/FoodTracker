//
//  PresenterProtocol.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 05/05/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

protocol PresenterProtocol {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func viewDidDisappear(_ animated: Bool)
}
