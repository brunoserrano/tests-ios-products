//
//  ProductRouter.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 20/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit

class ProductRouter: ProductPresenterToRouterProtocol {
    static func createModule() -> ProductViewController {
        let viewController = storyboard.instantiateViewController(identifier: "ProductViewController") as! ProductViewController
        
        let presenter = ProductPresenter()
        let interactor = ProductInteractor()
        let router = ProductRouter()
        
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
    
    func pushToDetailScreen(navigationController: UINavigationController) {
        // TODO: Go to details screen
    }
}
