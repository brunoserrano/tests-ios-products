//
//  ProductPresenter.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 17/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

class ProductPresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingProduct() {
        interactor?.fetchProduct()
    }
    
    func showDetailController(navigationController: UINavigationController) {
        router?.pushToDetailScreen(navigationController: navigationController)
    }
}

extension ProductPresenter: InteractorToPresenterProtocol {
    func productFetchedSuccess(productModelArray: Array<ProductModel>) {
        view?.showProduct(productArray: productModelArray)
    }
    
    func productFetchFailed() {
        view?.showError()
    }
}
