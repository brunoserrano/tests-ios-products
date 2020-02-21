//
//  ProductPresenter.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 17/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

class ProductDetailsPresenter: ProductDetailsViewToPresenterProtocol {
    var view: ProductDetailsPresenterToViewProtocol?
    
    var interactor: ProductDetailsPresenterToInteractorProtocol?
    
    var router: ProductDetailsPresenterToRouterProtocol?
    
    func getProduct() {
        interactor?.getProductDetails()
    }
}

extension ProductDetailsPresenter: ProductDetailsInteractorToPresenterProtocol {
    func presentProduct(product: ProductModel) {
        view?.showProductDetails(product: product)
    }
}
