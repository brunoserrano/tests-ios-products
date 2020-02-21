//
//  ProductDetailsViewController.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 16/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    var presenter: ProductDetailsViewToPresenterProtocol?
    var product: ProductModel? {
        didSet {
            self.title = product?.name
            
            self.titleLabel.text = product?.name
            self.priceLabel.text = product?.price?.toCurrencyString(currencySymbol: "$")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getProduct()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ProductDetailsViewController: ProductDetailsPresenterToViewProtocol {
    func showProductDetails(product: ProductModel) {
        self.product = product
    }
}
