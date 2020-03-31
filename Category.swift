//
//  Category.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 02/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYCategory: NSObject, Mappable {
    
    //Required
    @objc public var identifier: String!
    @objc public var name: String!
    
    // Optional
    @objc public var parents: [String]?
    
    @objc public init(identifier: String, name: String, parents: [String]? = []) {
        self.identifier = identifier
        self.name = name
        self.parents = parents
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["id"] == nil || map.JSON["name"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.identifier <- map["id"]
        self.name <- map["name"]
        self.parents <- map["parents"]
    }
    
}
