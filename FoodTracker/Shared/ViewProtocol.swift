//
//  ViewProtocol.swift
//  FoodTracker
//
//  Created by Jon Holmberg on 05/05/2018.
//  Copyright © 2018 Jon Holmberg. All rights reserved.
//

import Foundation

protocol ViewProtocol {
    func setTitle(_ text: String)
    func setupLeftBarButton(_ action: (() -> Void)?)
    func setupRightBarButton(_ action: (() -> Void)?)
}
