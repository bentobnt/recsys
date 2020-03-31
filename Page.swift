//
//  Page.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 31/05/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYPage: NSObject, Mappable {
    
    // Required
    public var name: BGYPageType!
    
    // Optional
    @objc public var timestamp: Date?
    @objc public var url: String?
    @objc public var tags: [String:String]?
    @objc public var categories: [BGYCategory]?
    
    @objc public init(name: BGYPageType) {
        self.name = name
        self.timestamp = Date()
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["name"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.name <- map["name"]
        self.timestamp <- (map["timestamp"], DateTransform())
        self.url <- map["url"]
        self.tags <- map["tags"]
        self.categories <- map["categories"]
    }
    
}


@objc public enum BGYPageType: Int, RawRepresentable {
    case home
    case product
    case product_unavailable
    case category
    case campaign
    case cart
    case empty_cart
    case checkout
    case confirmation
    case search
    case empty_search
    case not_found
    case order_list
    case order_detail
    case wishlist
    case internals
    case unknown
    case other
    
    public typealias RawValue = String
    
    public var rawValue: RawValue {
        switch self {
        case .home:
            return "home"
        case .product:
            return "product"
        case .product_unavailable:
            return "product_unavailable"
        case .category:
            return "category"
        case .campaign:
            return "campaign"
        case .cart:
            return "cart"
        case .empty_cart:
            return "empty_cart"
        case .checkout:
            return "checkout"
        case .confirmation:
            return "confirmation"
        case .search:
            return "search"
        case .empty_search:
            return "empty_search"
        case .not_found:
            return "not_found"
        case .order_list:
            return "order_list"
        case .order_detail:
            return "order_detail"
        case .wishlist:
            return "wishlist"
        case .internals:
            return "internals"
        case .unknown:
            return "unknown"
        case .other:
            return "other"
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue.lowercased() {
        case "home":
            self = .home
        case "product":
            self = .product
        case "product_unavailable":
            self = .product_unavailable
        case "category":
            self = .category
        case "campaign":
            self = .campaign
        case "cart":
            self = .cart
        case "empty_cart":
            self = .empty_cart
        case "checkout":
            self = .checkout
        case "confirmation":
            self = .confirmation
        case "search":
            self = .search
        case "empty_search":
            self = .empty_search
        case "not_found":
            self = .not_found
        case "order_list":
            self = .order_list
        case "order_detail":
            self = .order_detail
        case "wishlist":
            self = .wishlist
        case "internals":
            self = .internals
        case "other":
            self = .other
        default:
            self = .unknown
        }
    }
}
