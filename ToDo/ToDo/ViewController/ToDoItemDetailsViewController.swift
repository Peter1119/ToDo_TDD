//
//  ToDoItemDetailsViewController.swift
//  ToDo
//
//  Created by 홍석현 on 9/20/24.
//

import UIKit
import MapKit

class ToDoItemDetailsViewController: UIViewController {
    let titleLabel = UILabel()
    let dateLabel = UILabel()
    let locationLabel = UILabel()
    let descriptionLabel = UILabel()
    let mapView = MKMapView()
    let doneButton = UIButton()
    var toDoItem: ToDoItem? {
        didSet {
            titleLabel.text = toDoItem?.title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
    }
    
    // MARK: - Layout
    private func layout() {
        self.view.addSubview(titleLabel)
        self.view.addSubview(dateLabel)
        self.view.addSubview(locationLabel)
        self.view.addSubview(descriptionLabel)
        self.view.addSubview(mapView)
        self.view.addSubview(doneButton)
    }
}
