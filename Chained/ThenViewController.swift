//
//  ThenViewController.swift
//  Chained
//
//  Created by DianQK on 8/12/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

private typealias UIImageViewConfig = (UIImageView) -> Void
private typealias UIButtonConfig = (UIButton) -> Void

private struct Config {
    static let scaleAspectFit: UIImageViewConfig = { imageView in
        imageView.contentMode = .scaleAspectFit
    }

    static func image(_ image: UIImage?) -> UIImageViewConfig {
        return { imageView in
            imageView.image = image
        }
    }

    static func title(_ title: String) -> UIButtonConfig {
        return { button in
            button.setTitle(title, for: UIControlState())
        }
    }
}

class ThenViewController: UIViewController {

    private lazy var avatarImageView = UIImageView()
        .then(Config.scaleAspectFit)
        .then(Config.image(UIImage(named: "DianQK")))

    private lazy var detailButton = UIButton()
        .then(Config.title("详情"))

}
