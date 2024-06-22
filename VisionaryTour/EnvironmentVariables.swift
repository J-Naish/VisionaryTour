//
//  Environment.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/06/23.
//

import Foundation

public enum EnvironmentVariables {
    enum Keys {
        static let googleMapsApiKey = "GOOGLE_MAPS_API_KEY"
        static let cloudflareApiKey = "CLOUDFLARE_API_KEY"
    }
    
    // getting plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    // get key data from plist
    static let googleMapsApiKey: String = {
        guard let googleMapsApiKeyString = EnvironmentVariables.infoDictionary[Keys.googleMapsApiKey] as? String else {
            fatalError("Google Maps API key not found")
        }
        return googleMapsApiKeyString
    }()
    
    static let cloudflareApiKey: String = {
        guard let cloudflareApiKeyString = EnvironmentVariables.infoDictionary[Keys.cloudflareApiKey] as? String else {
            fatalError("Cloudflare API key not found")
        }
        return cloudflareApiKeyString
    }()
}
