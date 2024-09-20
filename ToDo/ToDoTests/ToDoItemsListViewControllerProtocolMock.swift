//
//  ToDoItemsListViewControllerProtocolMock.swift
//  ToDoTests
//
//  Created by 홍석현 on 9/20/24.
//

import UIKit
@testable import ToDo

class ToDoItemsListViewControllerProtocolMock: ToDoItemsListViewControllerProtocol {
    var selectToDoItemReceivedArguments: (viewController: UIViewController, item: ToDoItem)?
    
    func selectToDoItem(_ viewController: UIViewController, item: ToDoItem) {
        selectToDoItemReceivedArguments = (viewController, item)
    }
}
