//
//  RequestService.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 05/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation

class RequestService {
    
    func getMobileUrl(metadata: BGYMetadata) -> String {
        var mobileUrl = "mobile/"
        mobileUrl.append(metadata.page.name.rawValue + "/")
        let pageType: BGYPageType = metadata.page.name
        
        switch pageType{
        case .campaign:
            mobileUrl.append(metadata.campaign!.name!)
            break
        case .category:
            mobileUrl.append("\(metadata.categories![0].name!)_\(metadata.categories![0].identifier!)")
            break
        case .product, .product_unavailable:
            mobileUrl.append(metadata.product!.identifier!)
            break
        case .search, .empty_search:
            mobileUrl.append(metadata.search!.query!)
            break
        default:
            break
        }
        
        return mobileUrl.replacingOccurrences(of: " ", with: "+")
    }
    
    func buildTrackUrl(apiKey: String, apiHost: String, sessionId: String, visitorId: String, mobileUrl: String) -> String {
        let storeId = apiKey
        var completeUrl = apiHost
        
        if completeUrl.last! != "/" {
            completeUrl.append("/")
        }
        
        completeUrl.append("track-api/v2/track/site")
        var queryUrl = "?sid=\(storeId)&visitorId=\(visitorId)&sessionId=\(sessionId)&url=\(mobileUrl)"
        let allowedCharacterSet = (CharacterSet.urlQueryAllowed)
        queryUrl = queryUrl.addingPercentEncoding(withAllowedCharacters: allowedCharacterSet)!
        
        completeUrl.append(queryUrl)
        return completeUrl
    }
    
    func buildRecommenationUrl(apiKey: String, apihost: String, strategy: BGYStrategy) -> String {
        let storeId = apiKey
        var completeUrl = apihost
        
        if completeUrl.last! != "/" {
            completeUrl.append("/")
        }
        
        completeUrl.append("rec-api/v1/")
        completeUrl.append(storeId)
        completeUrl.append("/ondemand/")
        completeUrl.append(strategy.rawValue)
        
        return completeUrl.replacingOccurrences(of: " ", with: "+")
    }
    
    func buildRecommendationViewUrl(apiKey: String, apiHost: String, strategy: BGYStrategy) -> String {
        let prefixUrl = buildRecommenationUrl(apiKey: apiKey, apihost: apiHost, strategy: strategy)
        
        return prefixUrl.appending("/view")
    }
    
    func buildRecommendationClickUrl(apiKey: String, apiHost: String, strategy: BGYStrategy) -> String {
        let prefixUrl = buildRecommenationUrl(apiKey: apiKey, apihost: apiHost, strategy: strategy)
        
        return prefixUrl.appending("/click")
    }
}
