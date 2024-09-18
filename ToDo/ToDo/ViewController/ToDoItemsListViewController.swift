//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by 홍석현 on 9/18/24.
//

import UIKit

class ToDoItemsListViewController: UIViewController {
    let tableView = UITableView()
    var toDoItemStore: ToDoItemStoreProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        configuration()
    }
    
    // MARK: - Layout
    private func layout() {
        self.view.addSubview(tableView)
    }
    
    // MARK: - Configuration
    private func configuration() {
        
    }
}
