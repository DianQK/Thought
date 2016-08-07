//
//  CartViewController.swift
//  RxDealCell
//
//  Created by DianQK on 8/4/16.
//  Copyright © 2016 T. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

struct ProductInfo {
    let id: Int64
    let name: String
    let unitPrice: Int
    let count: Variable<Int>
}

extension ProductInfo: Hashable, Equatable, IdentifiableType {
    var hashValue: Int {
        return id.hashValue
    }
    var identity: Int64 {
        return id
    }
}

typealias ProductSectionModel = AnimatableSectionModel<String, ProductInfo>

func ==(lhs: ProductInfo, rhs: ProductInfo) -> Bool {
    return lhs.id == rhs.id
}

class CartViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var totalPriceLabel: UILabel!
    @IBOutlet private weak var purchaseButton: UIButton!
    
    private let dataSource = RxTableViewSectionedReloadDataSource<ProductSectionModel>()
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        let products = [
            ProductInfo(id: 10001, name: "Product1", unitPrice: 100, count: Variable(1)),
            ProductInfo(id: 10002, name: "Product2", unitPrice: 200, count: Variable(1)),
            ProductInfo(id: 10003, name: "Product3", unitPrice: 300, count: Variable(1)),
            ProductInfo(id: 10004, name: "Product4", unitPrice: 400, count: Variable(1))
        ]
        
        let sectionInfo = Observable.just([ProductSectionModel(model: "", items: products)])
            .shareReplay(1)

        dataSource.configureCell = { _, tableView, indexPath, product in
            let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.productTableViewCell, forIndexPath: indexPath)!
            cell.name = product.name
            cell.setUnitPrice(product.unitPrice)
            (cell.rx_count <-> product.count).addDisposableTo(cell.reusableDisposeBag)
            return cell
        }

        sectionInfo
            .bindTo(tableView.rx_itemsWithDataSource(dataSource))
            .addDisposableTo(disposeBag)

        let totalPrice = sectionInfo
            .map { $0.flatMap { $0.items } }
            .flatMap { $0.reduce(Observable<Int>.just(0)) { acc, x in
                Observable.combineLatest(acc, x.count.asObservable().map { x.unitPrice * $0 }, resultSelector: +)
                }
            }
            .shareReplay(1)

        totalPrice
            .map { "总价：\($0) 元" }
            .bindTo(totalPriceLabel.rx_text)
            .addDisposableTo(disposeBag)

        totalPrice
            .map { Bool($0) }
            .bindTo(purchaseButton.rx_enabled)
            .addDisposableTo(disposeBag)

        tableView.rx_itemSelected
            .map { ($0, animated: true) }
            .subscribeNext(tableView.deselectRowAtIndexPath)
            .addDisposableTo(disposeBag)

    }

}
