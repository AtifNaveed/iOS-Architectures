//
//  HomePresenter.swift
//  MVPArchitectureiOS
//
//  Created by Atif on 05/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit


// Home View To Home Presenter & viceversa
protocol HomePresenterToViewProtocol: class {
    func fetchNews(news: [NewsModel])
    func fetchingNewsFailedWithError(error: Error)
}
protocol HomeViewToPresenterProtocol: class {
    var homeView: HomePresenterToViewProtocol? {get set}
    func updateHomeView()
    func showDetail(from view: HomePresenterToViewProtocol, forPost news: NewsModel)
}

class HomePresenter: HomeViewToPresenterProtocol, ServiceProtocol {
    var homeView: HomePresenterToViewProtocol?
    var apiRequest: Service?

    func updateHomeView() {
        apiRequest = Service()
        apiRequest!.delegate = self
        apiRequest!.apiRequest()
    }
    
    func apiRespondSuccessfully(news: [NewsModel]) {
        self.homeView?.fetchNews(news: news)
    }
    
    func apiRequestFailedWithError(error: Error) {
        self.homeView?.fetchingNewsFailedWithError(error: error)
    }
    
    func showDetail(from view: HomePresenterToViewProtocol, forPost news: NewsModel) {
        guard let detailVC = appDelegate().storyboard().instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController else { return }
        let presenter: DetailViewToPresenterProtocol = DetailPresenter()
        detailVC.presenter = presenter
        detailVC.presenter?.detailView = detailVC
        detailVC.presenter?.news = news
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}
