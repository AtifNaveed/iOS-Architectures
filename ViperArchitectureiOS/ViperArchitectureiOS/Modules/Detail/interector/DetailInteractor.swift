//
//  DetailInteractor.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 04/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class DetailInteractor: DetailPresenterToInteractorProtocol {
    
    var presenter: DetailInteractorToPresenterProtocol?

    func showDetail(forPost news: NewsModel) {
        presenter?.showDetail(news: news)
    }
}
