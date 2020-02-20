//
//  ProductProtocol.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 16/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

protocol ProductViewToPresenterProtocol: class {
    
    var view: ProductPresenterToViewProtocol? {get set}
    var interactor: ProductPresenterToInteractorProtocol? {get set}
    var router: ProductPresenterToRouterProtocol? {get set}
    func startFetchingProduct()
    func showDetailController(navigationController: UINavigationController)
    
}

protocol ProductPresenterToViewProtocol: class {
    func showProducts(productArray: Array<ProductModel>)
    func showFetchError()
}

protocol ProductPresenterToRouterProtocol: class {
    static func createModule() -> ProductViewController
    func pushToDetailScreen(navigationController: UINavigationController)
}

protocol ProductPresenterToInteractorProtocol: class {
    var presenter: ProductInteractorToPresenterProtocol? {get set}
    func fetchProduct()
}

protocol ProductInteractorToPresenterProtocol: class {
    func productFetchedSuccess(productModelArray: Array<ProductModel>)
    func productFetchFailed()
}
