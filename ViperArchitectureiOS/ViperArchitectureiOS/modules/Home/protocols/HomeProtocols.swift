//
//  HomeProtocols.swift
//  VIPER (View-Interactor-Presentor-Entity-Router)
//
//  Created by Atif on 02/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

// View To Presenter & viceversa
protocol PresenterToViewProtocol: class {
    func loadNews(news: [NewsModel])
    func loadingFailed()
}
protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interactor: PresenterToInteractorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
}

// Interactor to Presnter & viceversa
protocol InteractorToPresenterProtocol: class {
    func fetchNewsData(news: [NewsModel])
    func fetchingNewsFailedWithError(error: Error)
}
protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? {get set}
    func fetchNews()
}

// Presenter to Router
protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
}


