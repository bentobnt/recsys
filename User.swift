//
//  User.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 02/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import ObjectMapper

@objc public class BGYUser: NSObject, Mappable {
    
    //Required
    @objc public var identifier: String!
    @objc public var name: String!
    @objc public var email: String!
    public var allowMailMarketing: Bool!
    public var gender: BGYGender!
    
    //Optional
    public var language: BGYLanguage?
    public var country:  BGYCountry?
    @objc public var username: String?
    @objc public var nickname: String?
    @objc public var birthday: String?
    @objc public var tags: [String]?
    @objc public var zipCode: String?
    
    @objc public var documentId: String?
    @objc public var extraInfo: [String:String]?
    @objc public var remoteUrl: String?
    
    @objc public init(identifier: String, name: String, email: String, allowMailMarketing: Bool, gender: BGYGender) {
        self.identifier = identifier
        self.name = name
        self.email = email
        self.allowMailMarketing = allowMailMarketing
        self.gender = gender
    }
    
    //MARK: - ObjectMapper
    public required init?(map: Map) {
        if map.JSON["id"] == nil ||
            map.JSON["name"] == nil ||
            map.JSON["email"] == nil ||
            map.JSON["allow_mail_marketing"] == nil ||
            map.JSON["gender"] == nil {
            return nil
        }
    }
    
    public func mapping(map: Map) {
        self.identifier <- map["id"]
        self.name <- map["name"]
        self.email <- map["email"]
        self.allowMailMarketing <- map["allow_mail_marketing"]
        self.language <- map["language"]
        self.country <- map["country"]
        self.gender <- map["gender"]
        self.username <- map["username"]
        self.nickname <- map["nickname"]
        self.birthday <- map["birthday"]
        self.tags <- map["tags"]
        self.zipCode <- map["zipCode"]
        self.documentId <- map["document_id"]
        self.extraInfo <- map["extra_info"]
        self.remoteUrl <- map["remote_url"]
    }
    
}


@objc public enum BGYGender: Int, RawRepresentable {
    case male
    case female
    
    public typealias RawValue = String
    
    public var rawValue: RawValue {
        switch self {
        case .male:
            return "M"
        case .female:
            return "F"
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue.uppercased() {
        case "M":
            self = .male
        case "F":
            self = .female
        default:
            self = .male
        }
    }
}

@objc public enum BGYCountry: Int, RawRepresentable {
    case brazil
    case us
    
    public typealias RawValue = String
    
    public var rawValue: RawValue {
        switch self {
        case .brazil:
            return "BR"
        case .us:
            return "US"
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue.uppercased() {
        case "BR":
            self = .brazil
        case "US":
            self = .us
        default:
            self = .brazil
        }
    }
}

public enum BGYLanguage: Int, RawRepresentable {
    case pt_br
    case en_us
    
    public typealias RawValue = String
    
    public var rawValue: RawValue {
        switch self {
        case .pt_br:
            return "pt-BR"
        case .en_us:
            return "en-US"
        }
    }
    
    public init?(rawValue: RawValue) {
        switch rawValue.uppercased() {
        case "pt-BR":
            self = .pt_br
        case "en-US":
            self = .en_us
        default:
            self = .pt_br
        }
    }
}

