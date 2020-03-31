//
//  SessionManager.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 06/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import Arcane

class SessionManager {
    
    static let SESSION_ID_EXPIRATION_LIMIT: Double = 1800; //30 minutes in seconds
    static let VISITOR_ID_EXPIRATION_LIMIT: Double = 34190000; //13 months
    static let KEY_SESSION_ID = "biggySessionId"
    static let KEY_VISITOR_ID = "biggyVisitorId"
    static let KEY_SESSION_CA = "biggySessionCreatedAt"
    static let KEY_VISITOR_CA = "biggyVisitorCreatedAt"
    
    private static func getId(idKey: String, caKey: String, expLimit: Double) throws -> String {
        let preferences = UserDefaults.standard
        if let sessionId = preferences.string(forKey: idKey), let createdAt = preferences.object(forKey: caKey) as? Date {
            if(abs(createdAt.timeIntervalSince(Date())) < expLimit) {
                return sessionId
            }
        }
        
        if let sessionId = createId() {
            preferences.set(sessionId, forKey: idKey)
            preferences.set(Date(), forKey: caKey)
            return sessionId
        }
        
        throw BiggyError.HashNotCreated
    }
    
    static func getSessionId() throws -> String {
        return try getId(idKey: KEY_SESSION_ID, caKey: KEY_SESSION_CA, expLimit: SESSION_ID_EXPIRATION_LIMIT)
    }
    
    static func renewSessionId() {
        let preferences = UserDefaults.standard
        preferences.set(Date(), forKey: KEY_SESSION_CA)
    }
    
    static func getVisitorId() throws -> String {
        return try getId(idKey: KEY_VISITOR_ID, caKey: KEY_VISITOR_CA, expLimit: VISITOR_ID_EXPIRATION_LIMIT)
    }
    
    private static func createId() -> String? {
        let randomString = "\(arc4random())\(arc4random())\(Date().timeIntervalSince1970 * 1000)\(arc4random())\(arc4random())"
        return Hash.SHA1(randomString)
    }
    
}
