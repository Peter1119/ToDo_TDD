//
//  ToDoItemsListViewController.swift
//  ToDo
//
//  Created by 홍석현 on 9/18/24.
//

import UIKit
import Combine

protocol ToDoItemsListViewControllerProtocol {
    func selectToDoItem(_ viewController: UIViewController, item: ToDoItem)
}

class ToDoItemsListViewController: UIViewController {
    enum Section {
        case todo
        case done
    }
    
    let tableView = UITableView()
    private var dataSource: UITableViewDiffableDataSource<Section, ToDoItem>?
    var delegate: ToDoItemsListViewControllerProtocol?
    
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
        self.tableView.delegate = self
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
        snapshot.appendSections([.todo, .done])
        snapshot.appendItems(
            items.filter { $0.done == false },
            toSection: .todo
        )
        
        snapshot.appendItems(
            items.filter { $0.done },
            toSection: .done
        )
        dataSource?.apply(snapshot)
    }
}

extension ToDoItemsListViewController: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let item = items[indexPath.row]
        delegate?.selectToDoItem(self, item: item)
    }
}
