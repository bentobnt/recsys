//
//  BiggyClient.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 02/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

@objc public class BGYBiggyClient: NSObject {
    
    @objc public static var shared: BGYBiggyClient?
    
    private let requestService: RequestService
    private let apiHost: String
    private let apiKey: String
    private var debug: Bool?
    
    private init(dict: [String:AnyObject]) throws {
        self.requestService = RequestService()
        self.debug = dict["biggy_debug"] as? Bool ?? false
        if let apiHost = dict["biggy_api_host"] as? String, let apiKey = dict["biggy_api_key"] as? String {
            self.apiHost = apiHost
            self.apiKey = apiKey
        } else {
            throw BiggyError.MissingProperties
        }
    }
    
    @objc public static func instantiate(dict: [String:AnyObject]) throws {
        try BGYBiggyClient.shared = BGYBiggyClient(dict: dict)
    }
    
    @objc public static func instantiate(contentsOfFile: String) throws {
        try BGYBiggyClient.instantiate(dict: (NSDictionary(contentsOfFile: contentsOfFile) as? [String:AnyObject])!)
    }
    
    @objc public func track(metadata: BGYMetadata) throws {
        if !metadata.isValid() {
            throw BiggyError.InvalidMetadata
        }
        
        let mobileUrl = requestService.getMobileUrl(metadata: metadata)
        let sessionId = try SessionManager.getSessionId()
        let visitorId = try SessionManager.getVisitorId()
        SessionManager.renewSessionId()
        
        let url = requestService.buildTrackUrl(apiKey: self.apiKey, apiHost: self.apiHost, sessionId: sessionId, visitorId: visitorId, mobileUrl: mobileUrl)
        
        AF.request(url, method: .post, parameters: metadata.toJSON(), encoding: JSONEncoding.default).responseString(completionHandler: { response in
            if self.debug! {
                print("[BIGGY DEBUG]", url)
                print("[BIGGY DEBUG]", response.debugDescription)
            }
        })
    }
    
    @objc public func recommendation(recommendationMetadata: BGYRecommendationMetadata, completion: @escaping ([BGYRecommendation]?) -> ()) throws {
        let metadata = recommendationMetadata
        let sessionId = try SessionManager.getSessionId()
        let visitorId = try SessionManager.getVisitorId()
        
        metadata.sessionId = sessionId
        metadata.anonymousUser = visitorId
        
        let url = requestService.buildRecommenationUrl(apiKey: self.apiKey, apihost: self.apiHost, strategy: metadata.strategy)
        
        AF.request(url, method: .post, parameters: metadata.toJSON(), encoding: JSONEncoding.default).responseArray(completionHandler: { (response: DataResponse<[BGYRecommendation], AFError>) in
            if self.debug! {
                print("[BIGGY DEBUG]", url)
                print("[BIGGY DEBUG]", response.debugDescription)
                
                if let err = response.error {
                    print("[BIGGY DEBUG] ERROR - ", err.localizedDescription)
                }
            }
            
            let recommendations = response.value
            completion(recommendations)
        })
    }
    
    @objc public func recommendationView(recommendationViewMetadata: BGYRecommendationViewMetadata) throws {
        let metadata = recommendationViewMetadata
        let sessionId = try SessionManager.getSessionId()
        let visitorId = try SessionManager.getVisitorId()
        
        metadata.session = sessionId
        metadata.anonymousUser = visitorId
        
        let url = requestService.buildRecommendationViewUrl(apiKey: self.apiKey, apiHost: self.apiHost, strategy: metadata.strategy)
        
        AF.request(url, method: .post, parameters: metadata.toJSON(), encoding: JSONEncoding.default).responseString(completionHandler: { response in
            if self.debug! {
                print("[BIGGY DEBUG]", url)
                print("[BIGGY DEBUG]", response.debugDescription)
            }
        })
    }
    
    @objc public func recommendationClick(recommendationClickMetadata: BGYRecommendationClickMetadata) throws {
        let metadata = recommendationClickMetadata
        let sessionId = try SessionManager.getSessionId()
        let visitorId = try SessionManager.getVisitorId()
        
        metadata.session = sessionId
        metadata.anonymousUser = visitorId
        
        let url = requestService.buildRecommendationClickUrl(apiKey: self.apiKey, apiHost: self.apiHost, strategy: metadata.strategy)
        
        AF.request(url, method: .post, parameters: metadata.toJSON(), encoding: JSONEncoding.default).responseString(completionHandler: { response in
            if self.debug! {
                print("[BIGGY DEBUG]", url)
                print("[BIGGY DEBUG]", response.debugDescription)
            }
        })
    }
    
}
