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
    let dateFormatter = DateFormatter()
    
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
        self.tableView.register(
            ToDoItemCell.self,
            forCellReuseIdentifier: "ToDoItemCell"
        )
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
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "ToDoItemCell",
            for: indexPath
        ) as? ToDoItemCell else { return UITableViewCell() }
        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        
        let timestamp = item.timeStamp
        let date = Date(timeIntervalSince1970: timestamp)
        cell.dateLabel.text = dateFormatter.string(from: date)

        return cell
    }
}
