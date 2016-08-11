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
    func make(file: String = #file, line: UInt = #line, @noescape closure: (make: ConstraintMaker) -> Void) -> Constraint {
        view.snp_makeConstraints(file, line: line, closure: closure)
        return self
    }
}
