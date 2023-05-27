//
//  VideoModel.swift
//  Africa
//
//  Created by Jasmine Lai Hweeying on 25/05/2023.
//

import Foundation

struct Video: Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed Property
    
    var thumbnail: String{
        "video-\(id)"
    }
}
