//
//  Layout.swift
//  Chained
//
//  Created by DianQK on 8/12/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import SnapKit

struct Layout<View: UIView> {
    let view: View
    init(_ view: View) {
        self.view = view
    }
}

extension NSObjectProtocol where Self: UIView {
    var layout: Layout<Self> {
        return Layout(self)
    }
}

extension UIConfig where View: UIView {
    var layout: Layout<View> {
        return Layout(view)
    }
}

extension Layout {
    //    func make(file: String = #file, line: UInt = #line, @noescape closure: (make: ConstraintMaker) -> Void) -> Layout {
    //        view.snp_makeConstraints(file, line: line, closure: closure)
    //        return self
    //    }

    func adhereTo(_ superView: UIView) -> Constraint<View> {
        superView.addSubview(view)
        return Constraint(view)
    }
}
