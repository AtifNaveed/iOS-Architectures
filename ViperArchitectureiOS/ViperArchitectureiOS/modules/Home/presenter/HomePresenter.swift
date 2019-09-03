//
//  HomePresenter.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 03/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomePresenter: ViewToPresenterProtocol {
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interactor?.fetchNews()
    }
}

extension HomePresenter: InteractorToPresenterProtocol {
    func fetchNewsData(news: [NewsModel]) {
        view?.loadNews(news: news)
    }
    
    func fetchingNewsFailedWithError(error: Error) {
        view?.loadingFailed()
    }
}
