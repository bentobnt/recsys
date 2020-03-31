//
//  RecommendationMetadata.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 12/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYRecommendationMetadata: NSObject, Mappable {
    
    // Required
    public var strategy: BGYStrategy!
    @objc var sessionId: String? // required but set in BiggyClient call
    
    // Optional
    public var origin: BGYOrigin?
    @objc public var user: String?
    @objc public var products: [String]?
    @objc public var categories: [String]?
    @objc public var anonymousUser: String?
    
    @objc public init(strategy: BGYStrategy) throws {
        self.strategy = strategy
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["strategy"] == nil || map.JSON["sessionId"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.strategy <- map["strategy"]
        self.sessionId <- map["sessionId"]
        self.origin <- map["origin"]
        self.user <- map["user"]
        self.products <- map["products"]
        self.categories <- map["categories"]
        self.anonymousUser <- map["anonymousUser"]
    }
    
}

@objc public enum BGYStrategy: Int, RawRepresentable {
    case offers_store
    case offers_category
    case offers_user
    case most_viewed_store
    case most_viewed_category
    case most_viewed_campaign
    case most_viewed_user
    case best_sellers_store
    case best_sellers_category
    case best_sellers_campaign
    case best_sellers_user
    case new_releases_store
    case new_releases_category
    case new_releases_user
    case click_history
    case navigation_history
    case order_history
    case cart_abandonment
    case bought_together
    case best_choice
    case similar_products
    
    public typealias RawValue = String
    
    public var rawValue: RawValue {
        switch self {
        case .offers_store:
            return "offers_store"
        case .offers_category:
            return "offers_category"
        case .offers_user:
            return "offers_user"
        case .most_viewed_store:
            return "most_viewed_store"
        case .most_viewed_category:
            return "most_viewed_category"
        case .most_viewed_campaign:
            return "most_viewed_campaign"
        case .most_viewed_user:
            return "most_viewed_user"
        case .best_sellers_store:
            return "best_sellers_store"
        case .best_sellers_category:
            return "best_sellers_category"
        case .best_sellers_campaign:
            return "best_sellers_campaign"
        case .best_sellers_user:
            return "best_sellers_user"
        case .new_releases_store:
            return "new_releases_store"
        case .new_releases_category:
            return "new_releases_category"
        case .new_releases_user:
            return "new_releases_user"
        case .click_history:
            return "click_history"
        case .navigation_history:
            return "navigation_history"
        case .order_history:
            return "order_history"
        case .cart_abandonment:
            return "cart_abandonment"
        case .bought_together:
            return "bought_together"
        case .best_choice:
            return "best_choice"
        case .similar_products:
            return "similar_products"
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue.lowercased() {
        case "offers_store":
            self = .offers_store
        case "offers_category":
            self = .offers_category
        case "offers_user":
            self = .offers_user
        case "most_viewed_store":
            self = .most_viewed_store
        case "most_viewed_category":
            self = .most_viewed_category
        case "most_viewed_campaign":
            self = .most_viewed_campaign
        case "most_viewed_user":
            self = .most_viewed_user
        case "best_sellers_store":
            self = .best_sellers_store
        case "best_sellers_category":
            self = .best_sellers_category
        case "best_sellers_campaign":
            self = .best_sellers_campaign
        case "best_sellers_user":
            self = .best_sellers_user
        case "new_releases_store":
            self = .new_releases_store
        case "new_releases_category":
            self = .new_releases_category
        case "new_releases_user":
            self = .new_releases_user
        case "click_history":
            self = .click_history
        case "navigation_history":
            self = .navigation_history
        case "order_history":
            self = .order_history
        case "cart_abandonment":
            self = .cart_abandonment
        case "bought_together":
            self = .bought_together
        case "best_choice":
            self = .best_choice
        case "similar_products":
            self = .similar_products
        default:
            self = .offers_store
        }
    }
}

@objc public enum BGYOrigin: Int, RawRepresentable {
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
        default:
            self = .home
        }
    }
}

