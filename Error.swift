//
//  Error.swift
//  RecsysIOS
//
//  Created by Christian Mutti on 06/06/17.
//  Copyright © 2017 Biggy. All rights reserved.
//

import Foundation

public enum BiggyError: Error {
    
    case InvalidMetadata    // Metadata is missing fields
    case MissingProperties  // BiggyClient dict is missing properties
    case HashNotCreated     // Error while creating a hash (sessionId, visitorId)
    
}
