//
//  NewsModel.swift
//  MVVMArchitectureiOS
//
//  Created by Atif on 08/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import Foundation
import UIKit

struct NewsModel {
    var author: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
}

extension NewsModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
    }
}
