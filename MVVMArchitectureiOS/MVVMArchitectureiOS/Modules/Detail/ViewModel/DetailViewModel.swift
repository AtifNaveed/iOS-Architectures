//
//  DetailViewModel.swift
//  MVVMArchitectureiOS
//
//  Created by Atif on 08/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class DetailViewModel {
    var title: ((String) -> Void)?
    var descripton: ((String) -> Void)?
    var author: ((String) -> Void)?
    var imageUrl: ((String) -> Void)?

    func loadItem(item: NewsModel) {
        title?(item.title)
        descripton?(item.description)
        author?("\"\(item.author)\"")
        imageUrl?(item.urlToImage)
    }
}
