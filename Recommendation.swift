//
//  ProductRecommendation.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 12/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYRecommendation: NSObject, Mappable {
    
    @objc public var baseIds: [String]?
    @objc public var baseItems: [BGYProductRecommendation]?
    @objc public var recommendationIds: [String]?
    @objc public var recommendationItems: [BGYProductRecommendation]?
    
    public required init?(map: Map) {}
    
    public func mapping(map: Map) {
        self.baseIds <- map["baseIds"]
        self.baseItems <- map["baseItems"]
        self.recommendationIds <- map["recommendationIds"]
        self.recommendationItems <- map["recommendationItems"]
    }
    
}

@objc public class BGYProductRecommendation: NSObject, Mappable {
    
    @objc public var productId: String?
    @objc public var score: NSNumber?
    @objc public var offers: [BGYProductRecommendationOffer]?
    @objc public var specs: [BGYSpecType:BGYRecommendationSpecValue]?
    
    public required init?(map: Map) {}
    
    public func mapping(map: Map) {
        self.productId <- map["productId"]
        self.score <- map["score"]
        self.offers <- map["offers"]
        self.specs <- map["specs"]
    }
    
}

@objc public class BGYProductRecommendationOffer: NSObject, Mappable {
    
    @objc public var offerId: String?
    @objc public var sku: String?
    @objc public var distribuitionCenter: String?
    @objc public var name: String?
    @objc public var url: String?
    @objc public var imageUrl: String?
    @objc public var price: String?
    @objc public var oldPrice: String?
    @objc public var currencySymbol: String?
    @objc public var installment: [String:String]?
    public var hasDiscount: Bool?
    @objc public var discountPercentage: NSNumber?
    @objc public var extraInfo: [String:String]?
    @objc public var specs: [BGYRecommendationSpecValue]?
    
    public required init?(map: Map) {}
    
    public func mapping(map: Map) {
        self.offerId <- map["offerId"]
        self.sku <- map["sku"]
        self.distribuitionCenter <- map["distribuitionCenter"]
        self.name <- map["name"]
        self.imageUrl <- map["imageUrl"]
        self.oldPrice <- map["oldPrice"]
        self.currencySymbol <- map["currencySymbol"]
        self.installment <- map["installment"]
        self.hasDiscount <- map["hasDiscount"]
        self.discountPercentage <- map["discountPercentage"]
        self.extraInfo <- map["extraInfo"]
        self.specs <- map["specs"]
    }
    
}

@objc public class BGYRecommendationSpecValue: NSObject, Mappable {
        
    @objc public var identifier: String?
    @objc public var label: String?
    @objc public var type: BGYSpecType?
        
    @objc public var images: [String:String]?
    @objc public var imagesSsl: [String:String]?
    @objc public var subSpecs: [BGYRecommendationSpecValue]?
        
    public required init?(map: Map) {}
        
    public func mapping(map: Map) {
        self.identifier <- map["id"]
        self.label <- map["label"]
        self.type <- map["type"]
        self.images <- map["images"]
        self.imagesSsl <- map["imagesSsl"]
        self.subSpecs <- map["subSpecs"]
    }
        
}
