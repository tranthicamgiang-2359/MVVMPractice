//
//  ListActivityViewModel.swift
//  ToDo
//
//  Created by Tran Thi Cam Giang on 7/29/19.
//  Copyright © 2019 Tran Thi Cam Giang. All rights reserved.
//

import Foundation

class ListActivityViewModel {
    
    var reloadData: (() -> ())?
    var activities = [ActivityViewModel]() {
        didSet {
            //reload data
            reloadData?()
        }
    }
    var count: Int {
        return activities.count
    }
    
    func loadActivities() {
        activities = DataStore.getMockActivities()
    }
    
    func addActivity(_ activity: ActivityViewModel) {
        activities.append(activity)
    }
    
    func removeActivity(at index: Int) {
        activities.remove(at: index)
    }
    
    
}

extension ListActivityViewModel {
    func getActivity(for index: Int) -> ActivityViewModel {
        assert(index < count && index >= 0)
        
        return activities[index]
    }
    
    func numberOfItems() -> Int {
        return 10
    }
}

