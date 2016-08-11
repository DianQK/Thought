//
//  NamespaceViewController.swift
//  Chained
//
//  Created by DianQK on 8/12/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

class NamespaceViewController: UIViewController {
    
    private lazy var avatarImageView = UIImageView()
        .config
        .fill
        .image(UIImage(named: "DianQK"))
        .view
    
    private lazy var tableView: UITableView = UITableView()
        .config
        .automaticDimension(estimatedRowHeight: 48)
        .custom { (tableView) in
            tableView.delegate = self
        }
        .view
    
//    private lazy var tableView = UITableView()
//        .config
//        .automaticDimension(estimatedRowHeight: 48)
//        .custom { (tableView) in
//            tableView.delegate = self
//        }
//        .view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        avatarImageView
            .layout
            .adhereTo(self.view)
            .make { (make) in
                make.centerX.equalTo(self.view)
                make.centerY.equalTo(self.view)
            }
        
    }
    
}

extension NamespaceViewController: UITableViewDelegate {
    
}
