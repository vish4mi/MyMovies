//
//  ConfigurationManager.swift
//  MyMovies
//
//  Created by Vishal on 18/03/18.
//  Copyright © 2018 Vishal Bhadade. All rights reserved.
//

import UIKit
import ObjectMapper

class ConfigurationManager: NSObject {
    
    var environment : Environment?
    
    // Singleton method
    static let sharedManager: ConfigurationManager = {
        let instance = ConfigurationManager()
        // setup code
        return instance
    }()
    
    /// API Endpoint
    ///
    /// - Returns: Base URL for the current configuration
    func APIEndpoint () -> String  {
        return (environment?.apiEndPoint)!
    }
}
