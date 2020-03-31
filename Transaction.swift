//
//  Transaction.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 05/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYTransaction: NSObject, Mappable {
    
    //Required
    @objc public var identifier: String!
    @objc public var items: [BGYItem]!
    
    //Optional
    @objc public var signature: String?
    @objc public var installmentCount: NSNumber?
    @objc public var shipping: BGYShipping?
    @objc public var discount: NSNumber?
    @objc public var services: NSNumber?
    @objc public var paymentType: String?
    
    @objc public init(identifier: String, items: [BGYItem]) {
        self.identifier = identifier
        self.items = items
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["id"] == nil || map.JSON["items"] == nil || map.JSON["signature"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.identifier <- map["id"]
        self.items <- map["items"]
        self.signature <- map["signature"]
        self.installmentCount <- map["installment_count"]
        self.shipping <- map["shipping"]
        self.discount <- map["discount"]
        self.services <- map["services"]
        self.paymentType <- map["payment_type"]
    }
    
}

@objc public class BGYShipping: NSObject, Mappable {
    
    @objc public var costs: NSNumber?
    @objc public var deliveryDate: Date?
    @objc public var tracking: String?
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {}
    
    public func mapping(map: Map) {
        self.costs <- map["costs"]
        self.deliveryDate <- (map["delivery_date"], DateTransform())
        self.tracking <- map["tracking"]
    }
    
}
