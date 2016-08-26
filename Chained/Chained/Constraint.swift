//
//  Constraint.swift
//  Chained
//
//  Created by DianQK on 8/12/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import SnapKit

struct Constraint<View: UIView> {
    let view: View
    init(_ view: View) {
        self.view = view
    }
}

extension Constraint {
    @discardableResult
    func make(_ closure: (_ make: ConstraintMaker) -> Void) -> Constraint {
        view.snp.makeConstraints(closure)
        return self
    }
}

extension Constraint {
    var config: UIConfig<View> {
        return UIConfig(self.view)
    }
}
