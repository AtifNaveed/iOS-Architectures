//
//  HomePresenter.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 03/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomePresenter: HomeViewToPresenterProtocol {
    var homeView: HomePresenterToViewProtocol?
    
    var interactor: HomePresenterToInteractorProtocol?
    
    var router: HomePresenterToRouterProtocol?
    
    func updateHomeView() {
        interactor?.fetchNews()
    }
    
    func showDetail(forPost news: NewsModel) {
        router?.showDetail(from: homeView!, forPost: news)
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func fetchNewsData(news: [NewsModel]) {
        homeView?.loadNews(news: news)
    }
    
    func fetchingNewsFailedWithError(error: Error) {
        homeView?.loadingFailed()
    }
}
