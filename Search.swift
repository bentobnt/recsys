//
//  Search.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 02/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYSearch: NSObject, Mappable {
    
    //Required
    @objc public var query: String!
    
    // Optional
    @objc public var items: [[String:String]]?
    
    @objc public init(query: String) {
        self.query = query
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["query"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.query <- map["query"]
        self.items <- map["items"]
    }
    
}
