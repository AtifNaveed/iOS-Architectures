//
//  DetailPresenter.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 04/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class DetailPresenter: DetailViewToPresenterProtocol {
    var news: NewsModel?
    
    var detailView: DetailPresenterToViewProtocol?
    
    var interactor: DetailPresenterToInteractorProtocol?
    
    var router: DetailPresenterToRouterProtocol?
    
    func updateDetailView() {
        interactor?.showDetail(forPost: news!)
    }
}

extension DetailPresenter: DetailInteractorToPresenterProtocol {
    func showDetail(news: NewsModel) {
        detailView?.showDetail(forPost: news)
    }
}
