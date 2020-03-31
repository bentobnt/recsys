//
//  Product.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 02/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYProduct: NSObject, Mappable {
    
    //Required
    @objc public var identifier: String!
    @objc public var name: String!
    @objc public var desc: String!
    @objc public var url: String!
    @objc public var images: [String:String]!
    public var status: BGYStatus!
    @objc public var categories: [BGYCategory]!
    @objc public var price: NSNumber!
    @objc public var tags: [BGYTag]!
    @objc public var skus: [BGYSku]!
    
    //Optional
    @objc public var campaign: String?
    @objc public var oldPrice: NSNumber?
    @objc public var installment: BGYInstallment?
    @objc public var imagesSsl: [String:String]?
    @objc public var brand: String?
    @objc public var published: String?
    @objc public var specs: [String:[BGYSpecValue]]?
    @objc public var unit: String?
    @objc public var kitProducts: [BGYProduct]?
    @objc public var details: [String:String]?
    @objc public var stock: NSNumber?
    
    @objc public init(identifier: String, name: String, desc: String, url: String, images: [String:String], status: BGYStatus, categories: [BGYCategory], price: NSNumber, tags: [BGYTag], skus: [BGYSku]) {
        self.identifier = identifier
        self.name = name
        self.desc = desc
        self.url = url
        self.images = images
        self.status = status
        self.categories = categories
        self.price = price
        self.tags = tags
        self.skus = skus
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["id"] == nil ||
            map.JSON["name"] == nil ||
            map.JSON["description"] == nil ||
            map.JSON["url"] == nil ||
            map.JSON["images"] == nil ||
            map.JSON["status"] == nil ||
            map.JSON["categories"] == nil ||
            map.JSON["price"] == nil ||
            map.JSON["tags"] == nil ||
            map.JSON["skus"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.identifier <- map["id"]
        self.name <- map["name"]
        self.desc <- map["description"]
        self.url <- map["url"]
        self.images <- map["images"]
        self.status <- map["status"]
        self.categories <- map["categories"]
        self.price <- map["price"]
        self.tags <- map["tags"]
        self.skus <- map["skus"]
        
        self.campaign <- map["campaign"]
        self.oldPrice <- map["old_price"]
        self.installment <- map["installment"]
        self.imagesSsl <- map["images_ssl"]
        self.brand <- map["brand"]
        self.published <- map["published"]
        self.specs <- map["specs"]
        self.unit <- map["unit"]
        self.kitProducts <- map["kitProducts"]
        self.details <- map["details"]
        self.stock <- map["stock"]
    }
    
}

@objc public class BGYSku: NSObject, Mappable {
    
    //Required
    @objc public var identifier: String!
    @objc public var sku: String!
    @objc public var specs: [String:String]!
    public var status: BGYStatus!
    @objc public var price: NSNumber!
    @objc public var images: [String:String]!
    
    //Optional
    @objc public var name: String?
    @objc public var desc: String?
    @objc public var url: String?
    @objc public var oldPrice: NSNumber?
    @objc public var basePrice: NSNumber?
    @objc public var installment: BGYInstallment?
    @objc public var stock: NSNumber?
    @objc public var extraInfo: [String:String]?
    
    @objc public init(identifier: String, sku: String, specs: [String:String], status: BGYStatus, price: NSNumber, images: [String:String]) {
        self.identifier = identifier
        self.sku = sku
        self.specs = specs
        self.status = status
        self.price = price
        self.images = images
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["id"] == nil ||
            map.JSON["sku"] == nil ||
            map.JSON["specs"] == nil ||
            map.JSON["status"] == nil ||
            map.JSON["price"] == nil ||
            map.JSON["images"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.identifier <- map["id"]
        self.sku <- map["sku"]
        self.specs <- map["specs"]
        self.status <- map["status"]
        self.price <- map["price"]
        self.images <- map["images"]
        self.name <- map["name"]
        self.desc <- map["description"]
        self.oldPrice <- map["old_price"]
        self.basePrice <- map["base_price"]
        self.installment <- map["installment"]
        self.stock <- map["stock"]
        self.extraInfo <- map["extra_info"]
    }
    
}

@objc public class BGYTag: NSObject, Mappable {
    
    //Required
    @objc public var identifier: String!
    @objc public var name: String!
    
    @objc public init(identifier: String, name: String? = nil) {
        self.identifier = identifier
        self.name = name ?? identifier
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
    }
}

@objc public class BGYInstallment: NSObject, Mappable {
    
    //Required
    @objc public var count: NSNumber!
    @objc public var price: NSNumber!
    
    @objc public init(count: NSNumber, price: NSNumber) {
        self.count = count
        self.price = price
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["count"] == nil || map.JSON["price"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.count <- map["count"]
        self.price <- map["price"]
    }
}



@objc public enum BGYStatus: Int, RawRepresentable {
    case available
    case unavailable
    
    public typealias RawValue = String
    
    public var rawValue: RawValue {
        switch self {
        case .available:
            return "available"
        case .unavailable:
            return "unavailable"
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue.lowercased() {
        case "available":
            self = .available
        case "unavailable":
            self = .unavailable
        default:
            self = .unavailable
        }
    }
}

@objc public class BGYSpecType: NSObject {
    
    @objc public static let size: String =  {
        return "size"
    }()
    
    @objc public static let color: String =  {
        return "color"
    }()
    
    @objc public static let flavor: String =  {
        return "flavor"
    }()
    
}

@objc public class BGYSpecValue: NSObject, Mappable {
    
    //Required
    @objc public var identifier: String!
    @objc public var label: String!
    
    //Optional
    @objc public var type: BGYSpecType?
    @objc public var url: String?
    @objc public var images: [String:String]?
    @objc public var imagesSsl: [String:String]?
    
    @objc public init(identifier: String, label: String) {
        self.identifier = identifier
        self.label = label
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["id"] == nil || map.JSON["label"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.identifier <- map["id"]
        self.label <- map["label"]
        self.type <- map["type"]
        self.url <- map["url"]
        self.images <- map["images"]
        self.imagesSsl <- map["imagesSsl"]
    }
    
}
