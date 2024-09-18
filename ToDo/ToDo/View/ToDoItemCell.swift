//
//  ToDoItemCell.swift
//  ToDo
//
//  Created by 홍석현 on 9/18/24.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    let titleLabel = UILabel()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
