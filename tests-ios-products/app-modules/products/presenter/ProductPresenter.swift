//
//  ProductPresenter.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 17/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

class ProductPresenter: ProductViewToPresenterProtocol {
    var view: ProductPresenterToViewProtocol?
    
    var interactor: ProductPresenterToInteractorProtocol?
    
    var router: ProductPresenterToRouterProtocol?
    
    func startFetchingProduct() {
        interactor?.fetchProduct()
    }
    
    func showDetailController(product: ProductModel, navigationController: UINavigationController) {
        router?.pushToDetailScreen(product: product, navigationController: navigationController)
    }
}

extension ProductPresenter: ProductInteractorToPresenterProtocol {
    func productFetchedSuccess(productModelArray: Array<ProductModel>) {
        view?.showProducts(productArray: productModelArray)
    }
    
    func productFetchFailed() {
        view?.showFetchError()
    }
}
