//
//  AppCoordinator.swift
//  ToDo
//
//  Created by Tran Thi Cam Giang on 7/30/19.
//  Copyright © 2019 Tran Thi Cam Giang. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator<Void> {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    override func start() -> Void {
        let todoListCoordinator = ToDoListCoordinator(window: window)
        coordinate(to: todoListCoordinator)
    }
}
