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
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var detailButton: UIButton = {
        let button = UIButton()
        button.setTitle("详情", for: UIControlState())
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(avatarImageView)
        avatarImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.centerY.equalTo(self.view)
        }

        view.addSubview(detailButton)
        detailButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.avatarImageView.snp.bottom).offset(30)
            make.centerX.equalTo(self.view)
        }

    }

}
