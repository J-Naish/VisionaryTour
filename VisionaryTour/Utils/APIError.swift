//
//  APIError.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/16.
//

enum APIError: Error {
    case networkError
    case unknown
    case invalidResponse
    
    var title: String {
        switch self {
        case .networkError:
            return "network error"
        case .unknown:
            return "unknown error"
        case .invalidResponse:
            return "invalid response"
        }
    }
}
