//
//  Config.swift
//  Chained
//
//  Created by DianQK on 8/12/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit

struct UIConfig<View> {
    let view: View
    init(_ view: View) {
        self.view = view
    }
}

extension NSObjectProtocol {
    var config: UIConfig<Self> {
        return UIConfig(self)
    }
}

extension UIConfig {
    func custom(_ config: View -> Void) -> UIConfig {
        config(view)
        return self
    }
}

extension UIConfig where View: UIButton {
    /// Button 的选择状态
    var select: UIConfig {
        // ...
        return self
    }
    
    func line(title title: String) -> UIConfig {
        // ...
        return self
    }
}

extension UIConfig where View: UILabel {
    /// title 样式
    var title: UIConfig {
        view.font = UIFont.boldSystemFontOfSize(14)
        // ...
        return self
    }

}

extension UIConfig where View: UIImageView {
    var fill: UIConfig {
        view.contentMode = .ScaleAspectFill
        return self
    }
    
    func image(_ image: UIImage?) -> UIConfig {
        view.image = image
        return self
    }
}

extension UIConfig where View: UIView {
    /// 设置 View 为分割线类型
    var separateLine: UIConfig {
        // ...
        return self
    }
    
    func backgroundColor(_ color: UIColor?) -> UIConfig {
        view.backgroundColor = color
        return self
    }
}

extension UIConfig where View: UITableView {
    var centerSeparatorInset: UIConfig {
        view.separatorInset = UIEdgeInsets(top: 1, left: 20, bottom: 1, right: 20)
        return self
    }
    
    func automaticDimension(estimatedRowHeight estimatedRowHeight: CGFloat) -> UIConfig {
        view.estimatedRowHeight = 48
        view.rowHeight = UITableViewAutomaticDimension
        return self
    }
    
    func rowHeight(_ height: CGFloat) -> UIConfig {
        view.rowHeight = height
        return self
    }

}

extension UIConfig where View: UITextField {
    func placeholder(_ text: String) -> UIConfig {
        view.placeholder = text
        return self
    }
}