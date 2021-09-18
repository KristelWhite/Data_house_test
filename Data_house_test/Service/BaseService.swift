//
//  BaseService.swift
//  Data_house_test
//
//  Created by Кристина Пастухова on 17.09.2021.
//  Copyright © 2021 Кристина Пастухова. All rights reserved.
//

import Foundation

enum ServerError: Error {
    case noDataProvided
    case failedToDecode
}


class BaseService {
    
    private var totalPages: Int = 1
    private var currentPage: Int = 1
    private var query: String = ""
    var canLoadMore: Bool = false

    func loadPhotos(about query: String, onComplete: @escaping ([PhotoModel]) -> Void, onError: @escaping (Error) -> Void)  {

//        guard let url = URL(string: NetworkConstants.baseURL + "/search/photos?page=\(currentPage)")?.appendingPathComponent("&query=" + query + "&client_id=" + NetworkConstants.accessKey) else {
//            print("not")
//            return
//        }
        var urlString = NetworkConstants.baseURL + "/search/photos?page=\(currentPage)&query=" + query + "&client_id=" + NetworkConstants.accessKey
        
        urlString = urlString.split(separator: " ").joined(separator: "%20")
        let url = URL(string: urlString)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                onError(error)
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    onError(ServerError.noDataProvided)
                }
                return
            }

            guard let photos = try? JSONDecoder().decode(PhotosListResponse.self, from: data) else {
                print("Could not decode")
                DispatchQueue.main.async {
                    onError(ServerError.failedToDecode)
                }
                return
            }
            DispatchQueue.main.async {
                guard  photos.total_pages != 0 else {
                    return
                }
                self.totalPages = photos.total_pages
                if self.currentPage < photos.total_pages {
                    self.canLoadMore = true
                    self.currentPage += 1
                } else {
                    self.canLoadMore = false
                }
                onComplete(photos.results)
            }
        }
        task.resume()
    }

}
