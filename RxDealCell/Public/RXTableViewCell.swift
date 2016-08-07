//
//  RXTableViewCell.swift
//  RxDealCell
//
//  Created by DianQK on 8/5/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift

class RXTableViewCell: UITableViewCell {

    private(set) var reusableDisposeBag = DisposeBag()

    override func prepareForReuse() {
        super.prepareForReuse()
        reusableDisposeBag = DisposeBag()
    }

}
