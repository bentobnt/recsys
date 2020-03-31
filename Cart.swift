//
//  Cart.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 05/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYCart: NSObject, Mappable {
    
    //Required
    @objc public var items: [BGYItem]!
    
    @objc public init(items: [BGYItem]) {
        self.items = items
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["items"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.items <- map["items"]
    }
    
}

@objc public class BGYItem: NSObject, Mappable {
    
    //Required
    @objc public var product: BGYProductCart!
    @objc public var quantity: NSNumber!
    
    @objc public init(product: BGYProductCart, quantity: NSNumber) {
        self.product = product
        self.quantity = quantity
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["product"] == nil || map.JSON["quantity"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.product <- map["product"]
        self.quantity <- map["quantity"]
    }
    
}

@objc public class BGYProductCart: NSObject, Mappable {
    
    //Required
    @objc public var identifier: String!
    @objc public var sku: String!
    @objc public var price: NSNumber!
    
    @objc public init(identifier: String, sku: String, price: NSNumber) {
        self.identifier = identifier
        self.sku = sku
        self.price = price
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["id"] == nil || map.JSON["sku"] == nil || map.JSON["price"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.identifier <- map["id"]
        self.sku <- map["sku"]
        self.price <- map["price"]
    }
    
}
