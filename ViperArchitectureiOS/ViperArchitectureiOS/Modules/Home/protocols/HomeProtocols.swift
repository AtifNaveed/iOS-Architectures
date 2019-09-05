//
//  HomeProtocols.swift
//  VIPER (View-Interactor-Presentor-Entity-Router)
//
//  Created by Atif on 02/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

// Home View To Home Presenter & viceversa
protocol HomePresenterToViewProtocol: class {
    func loadNews(news: [NewsModel])
    func loadingFailed()
}
protocol HomeViewToPresenterProtocol: class {
    var homeView: HomePresenterToViewProtocol? {get set}
    var interactor: HomePresenterToInteractorProtocol? {get set}
    var router: HomePresenterToRouterProtocol? {get set}
    func updateHomeView()
    func showDetail(forPost news: NewsModel)
}

// Home Interactor to Home Presnter & viceversa
protocol HomeInteractorToPresenterProtocol: class {
    func fetchNewsData(news: [NewsModel])
    func fetchingNewsFailedWithError(error: Error)
}
protocol HomePresenterToInteractorProtocol: class {
    var presenter: HomeInteractorToPresenterProtocol? {get set}
    func fetchNews()
}

// Home Presenter to Home Router
protocol HomePresenterToRouterProtocol: class {
    static func createHomeModule() -> UIViewController
    func showDetail(from view: HomePresenterToViewProtocol, forPost: NewsModel)
}


