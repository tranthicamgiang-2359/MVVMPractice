//
//  BaseCoordinator.swift
//  ToDo
//
//  Created by Tran Thi Cam Giang on 7/30/19.
//  Copyright © 2019 Tran Thi Cam Giang. All rights reserved.
//

import Foundation

class BaseCoordinator<ResultType> {
    var childCoordinators = [UUID: Any]()
    private let id = UUID()
    
    func start() -> ResultType {
        fatalError("implement me!")
    }
    
    func coordinate(to coordinator: BaseCoordinator) -> ResultType {
        store(coordinator)
        return coordinator.start()
    }
    
    func store(_ coordinator: BaseCoordinator) {
        childCoordinators[coordinator.id] = coordinator
    }
    
    func free(_ coordinator: BaseCoordinator) {
        childCoordinators[coordinator.id] = nil
    }
}
