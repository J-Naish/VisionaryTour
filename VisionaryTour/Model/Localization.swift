//
//  Localization.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/06/18.
//

import Foundation

struct Localization: Codable, Hashable {
    var en: String
    var zh: String
    var fr: String
    var de: String
    var ja: String
    var pt: String
    var es: String
    
    subscript(languageCode: String) -> String? {
        switch languageCode {
        case "en": return en
        case "zh": return zh
        case "fr": return fr
        case "de": return de
        case "ja": return ja
        case "pt": return pt
        case "es": return es
        default: return nil
        }
    }
}
