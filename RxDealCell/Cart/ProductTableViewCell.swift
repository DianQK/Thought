//
//  ProductTableViewCell.swift
//  RxDealCell
//
//  Created by DianQK on 8/4/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProductTableViewCell: RXTableViewCell {

    var name: String? {
        get {
            return nameLabel?.text
        }
        set {
            nameLabel?.text = newValue
        }
    }

    private var _count: Int = 0 {
        didSet {
            if _count < 1 {
                fatalError()
            }
            minusButton.enabled = Bool(_count - 1)
            countLabel.text = String(_count)
        }
    }

    private var countChanged: (Int -> Void)?

    var rx_count: ControlProperty<Int> {
        let source = Observable<Int>.create { [weak self] (observer) in
            self?.countChanged = observer.onNext
            return NopDisposable.instance
            }
            .distinctUntilChanged()

        let sink = UIBindingObserver(UIElement: self) { cell, count in
            cell._count = count
            }
            .asObserver()

        return ControlProperty(values: source, valueSink: sink)
    }

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var unitPriceLabel: UILabel!
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var minusButton: UIButton! {
        didSet {
            minusButton.addTarget(self, action: #selector(ProductTableViewCell.minusButtonTap), forControlEvents: .TouchUpInside)
        }
    }
    @IBOutlet private weak var plusButton: UIButton! {
        didSet {
            plusButton.addTarget(self, action: #selector(ProductTableViewCell.plusButtonTap), forControlEvents: .TouchUpInside)
        }
    }

    func setUnitPrice(_ unitPrice: Int) {
        unitPriceLabel.text = "单价：\(unitPrice) 元"
    }

    private dynamic func minusButtonTap() {
        changeCount(-=)
    }
    
    private dynamic func plusButtonTap() {
        changeCount(+=)
    }
    
    private typealias Action = (inout lhs: Int, rhs: Int) -> Void
    
    private func changeCount(action: Action) {
        action(lhs: &_count, rhs: 1)
        countChanged?(_count)
    }

}
