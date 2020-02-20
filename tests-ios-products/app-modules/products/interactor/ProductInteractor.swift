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

class ProductInteractor: ProductPresenterToInteractorProtocol {
    var presenter: ProductInteractorToPresenterProtocol?
    
    func fetchProduct() {
        Alamofire.request(API_PRODUCT_LIST).responseJSON { response in
            if let statusCode = response.response?.statusCode, statusCode < 300 {
                if let json = response.result.value as AnyObject? {
                    let arrayResponse = json["data"] as! NSArray
                    let arrayObject = Mapper<ProductModel>().mapArray(JSONArray: arrayResponse as! [[String: Any]])
                    self.presenter?.productFetchedSuccess(productModelArray: arrayObject)
                }
            }
            else {
                self.presenter?.productFetchFailed()
            }
        }
    }
}
