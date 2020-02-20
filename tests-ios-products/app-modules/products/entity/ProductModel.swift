//
//  ProductModel.swift
//  tests-ios-products
//
//  Created by Bruno Serrano dos Santos on 16/02/20.
//  Copyright © 2020 EagleSoft. All rights reserved.
//

import UIKit
import ObjectMapper

private let ID = "_id"
private let NAME = "name"
private let PRICE = "price"

class ProductModel: Mappable {
    
    internal var id : String?
    internal var name : String?
    internal var price : NSNumber?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map[ID]
        name <- map[NAME]
        price <- map[PRICE]
    }
    
}
