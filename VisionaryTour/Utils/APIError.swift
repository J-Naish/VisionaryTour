//
//  APIError.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/19.
//

enum APIError: Error {
    case networkError
    case invalidResponseError
    case unknownError

    var title: String {
        switch self {
        case .networkError:
            return "netowrk error"
        case .invalidResponseError:
            return "invalid response"
        case .unknownError:
            return "unknown error"
        }
    }
}
