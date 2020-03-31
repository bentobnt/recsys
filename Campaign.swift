//
//  Campaign.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 02/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYCampaign: NSObject, Mappable {
    
    //Required
    @objc public var identifier: String!
    @objc public var name: String!
    
    // Optional
    @objc public var desc: String?
    @objc public var brand: String?
    @objc public var gender: String?
    @objc public var type: String?
    @objc public var items: [[String:String]]?
    
    @objc public init(identifier: String, name: String) {
        self.identifier = identifier
        self.name = name
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
        self.desc <- map["description"]
        self.brand <- map["brand"]
        self.gender <- map["gender"]
        self.type <- map["type"]
        self.items <- map["items"]
    }
    
}
