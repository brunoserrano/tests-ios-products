//
//  ProductDetailsProtocol.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 20/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

protocol ProductDetailsViewToPresenterProtocol: class {
    
    var view: ProductDetailsPresenterToViewProtocol? {get set}
    var interactor: ProductDetailsPresenterToInteractorProtocol? {get set}
    var router: ProductDetailsPresenterToRouterProtocol? {get set}
    
    func getProduct()
}

protocol ProductDetailsPresenterToViewProtocol: class {
    func showProductDetails(product: ProductModel)
}

protocol ProductDetailsPresenterToRouterProtocol: class {
    static func createModule(product: ProductModel) -> ProductDetailsViewController
}

protocol ProductDetailsPresenterToInteractorProtocol: class {
    var presenter: ProductDetailsInteractorToPresenterProtocol? {get set}
    var product: ProductModel? {get set}
    func getProductDetails()
}

protocol ProductDetailsInteractorToPresenterProtocol: class {
    func presentProduct(product: ProductModel)
}
