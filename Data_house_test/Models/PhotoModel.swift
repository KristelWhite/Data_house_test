//
//  PhotoModel.swift
//  Data_house_test
//
//  Created by Кристина Пастухова on 17.09.2021.
//  Copyright © 2021 Кристина Пастухова. All rights reserved.
//

import Foundation

struct PhotoModel: Codable {
    let id: String
    let description: String?
    let urls: UrlsModel
}

struct UrlsModel: Codable {
    let regular: String
}

struct PhotosListResponse: Codable {
    let total_pages: Int 
    let results: [PhotoModel]
    
    
}
