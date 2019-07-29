//
//  ActivityViewModel.swift
//  ToDo
//
//  Created by Tran Thi Cam Giang on 7/29/19.
//  Copyright © 2019 Tran Thi Cam Giang. All rights reserved.
//

import Foundation


struct ActivityViewModel {
    var model: Activity
    
    var name: String {
        return model.name
    }
}

extension ActivityViewModel {
    init(_ name: String) {
        self.model = Activity(name: name)
    }
}
