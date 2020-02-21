//
//  ProductInteractor.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 17/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class ProductDetailsInteractor: ProductDetailsPresenterToInteractorProtocol {
    var presenter: ProductDetailsInteractorToPresenterProtocol?
    var product: ProductModel?
    
    func getProductDetails() {
        self.presenter?.presentProduct(product: product!)
    }
}
