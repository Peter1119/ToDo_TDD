//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by 홍석현 on 9/18/24.
//

import UIKit
import Combine

class ToDoItemsListViewController: UIViewController {
    enum Section {
        case main
    }
    
    let tableView = UITableView()
    private var dataSource: UITableViewDiffableDataSource<Section, ToDoItem>?
    
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
                self?.update(with: items)
            })
    }
    
    // MARK: - Layout
    private func layout() {
        self.view.addSubview(tableView)
    }
    
    // MARK: - Configuration
    private func configuration() {
        self.tableView.register(
            ToDoItemCell.self,
            forCellReuseIdentifier: "ToDoItemCell"
        )
        
        self.dataSource = UITableViewDiffableDataSource<Section, ToDoItem>(
            tableView: self.tableView,
            cellProvider: { [weak self] tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: "ToDoItemCell",
                    for: indexPath
                ) as! ToDoItemCell
                cell.titleLabel.text = item.title
                if let timestamp = item.timeStamp {
                    let date = Date(timeIntervalSince1970: timestamp)
                    cell.dateLabel.text = self?.dateFormatter.string(from: date)
                }
                return cell
            }
        )
    }
    
    private func update(with items: [ToDoItem]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, ToDoItem>()
        snapshot.appendSections([.main])
        snapshot.appendItems(items)
        dataSource?.apply(snapshot)
    }
}
