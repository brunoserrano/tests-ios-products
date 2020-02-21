//
//  ProductRouter.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 20/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

class ProductDetailsRouter: ProductDetailsPresenterToRouterProtocol {
    static func createModule(product: ProductModel) -> ProductDetailsViewController {
        let viewController = storyboard.instantiateViewController(identifier: "ProductDetailsViewController") as! ProductDetailsViewController
        
        let presenter = ProductDetailsPresenter()
        let interactor = ProductDetailsInteractor()
        interactor.product = product
        let router = ProductDetailsRouter()
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return viewController
    }
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name:"Main", bundle: .main)
    }
}
