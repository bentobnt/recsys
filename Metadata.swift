//
//  Metadata.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 02/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYMetadata: NSObject, Mappable {
    
    //Required
    @objc public var page: BGYPage!
    
    //Optional
    @objc public var host: String?
    @objc public var user: BGYUser?
    @objc public var campaign: BGYCampaign?
    @objc public var categories: [BGYCategory]?
    @objc public var search: BGYSearch?
    @objc public var product: BGYProduct?
    @objc public var cart: BGYCart?
    @objc public var transaction: BGYTransaction?
    
    @objc public init(page: BGYPage) {
        self.page = page
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["page"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.host <- map["host"]
        self.page <- map["page"]
        self.user <- map["user"]
        self.campaign <- map["campaign"]
        self.categories <- map["categories"]
        self.search <- map["search"]
        self.product <- map["product"]
        self.cart <- map["cart"]
        self.transaction <- map["transaction"]
    }
    
    @objc func isValid() -> Bool {
        let pageType: BGYPageType = self.page.name
        var valid = false
        
        switch pageType {
        case .home, .checkout, .internals, .unknown, .other, .wishlist, .order_list, .order_detail, .not_found:
            valid = true
            break
        case .campaign:
            valid = self.campaign != nil
            break
        case .category:
            valid = self.categories != nil
            break
        case .product:
            valid = self.product != nil
            break
        case .product_unavailable:
            valid = self.product != nil && self.product?.status == .unavailable && (self.product?.skus.isEmpty)!
            break
        case .search:
            valid = self.search != nil
            break
        case .empty_search:
            valid = self.search != nil && (self.search?.items?.isEmpty)!
            break
        case .cart:
            valid = self.cart != nil
            break
        case .empty_cart:
            valid = self.cart != nil && (self.cart?.items.isEmpty)!
            break
        case .confirmation:
            valid = self.transaction != nil
            break
        }
        
        return valid
    }
    
}
