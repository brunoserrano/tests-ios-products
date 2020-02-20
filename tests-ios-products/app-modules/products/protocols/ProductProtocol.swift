//
//  ProductProtocol.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 16/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

protocol ViewToPresenterProtocol: class{
    
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func startFetchingProduct()
    func showDetailController(navigationController: UINavigationController)
    
}

protocol PresenterToViewProtocol: class {
    func showProduct(productArray: Array<ProductModel>)
    func showError()
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> ProductViewController
    func pushToDetailScreen(navigationController: UINavigationController)
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchProduct()
}

protocol InteractorToPresenterProtocol: class {
    func productFetchedSuccess(productModelArray: Array<ProductModel>)
    func productFetchFailed()
}
