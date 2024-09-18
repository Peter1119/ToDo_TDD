//
//  ToDoItemCell.swift
//  ToDo
//
//  Created by 홍석현 on 9/18/24.
//

import UIKit

class ToDoItemCell: UITableViewCell {
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let locationLabel = UILabel()
    
    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(locationLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
