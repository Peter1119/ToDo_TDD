//
//  ToDoItemDetailsViewController.swift
//  ToDo
//
//  Created by 홍석현 on 9/20/24.
//

import UIKit

class ToDoItemDetailsViewController: UIViewController {
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    // MARK: - Layout
    private func layout() {
        self.view.addSubview(titleLabel)
    }
}
