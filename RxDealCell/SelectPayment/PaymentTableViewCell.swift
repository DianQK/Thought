//
//  PaymentTableViewCell.swift
//  RxDealCell
//
//  Created by DianQK on 8/5/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

enum Payment: Hashable, Equatable, IdentifiableType {
    /// 支付宝
    case alipay
    /// 微信
    case wechat
    /// 银联
    case unionpay
    
    private var icon: UIImage? {
        switch self {
        case .alipay:
            return R.image.purchase_icon_alipay()
        case .wechat:
            return R.image.purchase_icon_wechat()
        case .unionpay:
            return R.image.purchase_icon_unionpay()
        }
    }
    
    private var name: String {
        switch self {
        case .alipay:
            return "支付宝支付"
        case .wechat:
            return "微信支付"
        case .unionpay:
            return "银联支付"
        }
    }
    
    var identity: Int {
        return hashValue
    }
}

class PaymentTableViewCell: RXTableViewCell {

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var selectButton: UIButton!
    
    var rx_isSelectedPayment: AnyObserver<Bool> {
        return selectButton.rx_selected
    }
    
    private var _payment: Payment = Payment.alipay {
        didSet {
            iconImageView.image = _payment.icon
            nameLabel.text = _payment.name
        }
    }
    
    func setPayment(_ payment: Payment) {
        _payment = payment
    }

}
