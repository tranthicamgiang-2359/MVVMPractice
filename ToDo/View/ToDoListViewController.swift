//
//  ToDoListViewController.swift
//  ToDo
//
//  Created by Tran Thi Cam Giang on 7/29/19.
//  Copyright © 2019 Tran Thi Cam Giang. All rights reserved.
//

import Foundation
import UIKit

class ToDoListViewController: UITableViewController {
    
    @IBOutlet weak var addBarItem: UIBarButtonItem!
    
    @IBAction func addNewActivity(_ sender: Any) {
        showAddActivityAlert()
    }
    
    var listActivityVM = ListActivityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        setupListActivityVM()
        loadActivities()
        
    }
    
    func setupListActivityVM() {
        listActivityVM.reloadData = {[weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func loadActivities() {
        listActivityVM.loadActivities()
    }
}

// MARK: Datasource
extension ToDoListViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listActivityVM.count
    }
    
    private func configureCell(_ cell: UITableViewCell, with activity: ActivityViewModel) {
        cell.textLabel?.text = activity.name
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        configureCell(cell, with: listActivityVM.getActivity(for: indexPath.row))
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            listActivityVM.removeActivity(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

// MARK: Action
extension ToDoListViewController {
    func createNewActivity(_ name: String) {
        let newActivityVM = ActivityViewModel(name)
        listActivityVM.addActivity(newActivityVM)
        
    }
    
    func showAddActivityAlert() {
        let alert = UIAlertController(title: "Add new activity", message: "Enter new Activity", preferredStyle: .alert)
        alert.addTextField{ $0.placeholder = "Name" }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [unowned self] (_) in
            let textField = alert.textFields!.first!
            guard let name = textField.text else {
                //fill it!
                return
            }
            
            self.createNewActivity(name)
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}


