//
//  LazyViewController.swift
//  Chained
//
//  Created by DianQK on 8/12/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

class LazyViewController: UIViewController {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DianQK")
        imageView.contentMode = .ScaleAspectFit
        return imageView
    }()
    
    private lazy var detailButton: UIButton = {
        let button = UIButton()
        button.setTitle("详情", forState: .Normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(avatarImageView)
        avatarImageView.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }
        
        view.addSubview(detailButton)
        detailButton.snp_makeConstraints { (make) in
            make.top.equalTo(self.avatarImageView.snp_bottom).offset(30)
            make.centerX.equalTo(self.view)
        }
    }

}
