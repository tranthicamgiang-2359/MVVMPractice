//
//  ToDoListCoordinator.swift
//  ToDo
//
//  Created by Tran Thi Cam Giang on 7/30/19.
//  Copyright © 2019 Tran Thi Cam Giang. All rights reserved.
//

import Foundation
import UIKit

class ToDoListCoordinator: BaseCoordinator<Void> {
    var window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }
    override func start() -> Void {
        let listActivityVM = ListActivityViewModel()
        let viewController = ToDoListViewController.initFromStoryboard()
        viewController.listActivityVM = listActivityVM
        let navVC = UINavigationController(rootViewController: viewController)
        window.rootViewController = navVC
        window.makeKeyAndVisible()
    
    }
}
