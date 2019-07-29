//
//  DataStoreService.swift
//  ToDo
//
//  Created by Tran Thi Cam Giang on 7/29/19.
//  Copyright © 2019 Tran Thi Cam Giang. All rights reserved.
//

import Foundation

class DataStore {
    static func getMockActivities() -> [ActivityViewModel] {
        return [
            ActivityViewModel(model: Activity(name: "buy eggs 1")),
            ActivityViewModel(model: Activity(name: "buy eggs 2")),
            ActivityViewModel(model: Activity(name: "buy eggs 3")),
            ActivityViewModel(model: Activity(name: "buy eggs 4")),
            ActivityViewModel(model: Activity(name: "buy eggs 5")),
            ActivityViewModel(model: Activity(name: "buy eggs 6")),
            ActivityViewModel(model: Activity(name: "buy eggs 7")),
            ActivityViewModel(model: Activity(name: "buy eggs 8")),
            ActivityViewModel(model: Activity(name: "buy eggs 9")),
            ActivityViewModel(model: Activity(name: "buy eggs 10")),
        ]
    }
}
