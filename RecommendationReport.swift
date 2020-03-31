//
//  RecommendationReport.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 01/11/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYRecommendationViewMetadata: NSObject, Mappable {
    
    // Required
    public var strategy: BGYStrategy!
    public var session: String? // required but set in BiggyClient call
    
    // Optional
    public var origin: BGYOrigin?
    public var anonymousUser: String?
    
    @objc public init(strategy: BGYStrategy) throws {
        self.strategy = strategy
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["strategy"] == nil || map.JSON["session"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.strategy <- map["strategy"]
        self.session <- map["session"]
        self.origin <- map["origin"]
        self.anonymousUser <- map["anonymousUser"]
    }
}

@objc public class BGYRecommendationClickMetadata: NSObject, Mappable {
    
    // Required
    public var strategy: BGYStrategy!
    public var productId: String!
    public var session: String? // required but set in BiggyClient call
    
    // Optional
    public var origin: BGYOrigin?
    public var anonymousUser: String?
    
    @objc public init(strategy: BGYStrategy, productId: String) throws {
        self.strategy = strategy
        self.productId = productId
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["strategy"] == nil || map.JSON["session"] == nil || map.JSON["productId"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.strategy <- map["strategy"]
        self.productId <- map["productId"]
        self.session <- map["session"]
        self.origin <- map["origin"]
        self.anonymousUser <- map["anonymousUser"]
    }
}
