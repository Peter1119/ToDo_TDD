//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by 홍석현 on 9/18/24.
//

import UIKit
import Combine

class ToDoItemsListViewController: UIViewController {
    let tableView = UITableView()
    var toDoItemStore: ToDoItemStoreProtocol?
    private var items: [ToDoItem] = []
    private var token: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        configuration()
        
        token = toDoItemStore?.itemPublisher
            .sink(receiveValue: { [weak self] items in
                self?.items = items
            })
    }
    
    // MARK: - Layout
    private func layout() {
        self.view.addSubview(tableView)
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.tableView.dataSource = self
    }
}

extension ToDoItemsListViewController: UITableViewDataSource {
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return items.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = ToDoItemCell()
        cell.titleLabel.text = "dummy 1"
        return cell
    }
}
