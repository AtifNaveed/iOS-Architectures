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

class HomePresenter:HomeViewToPresenterProtocol {
    
    var homeView: HomePresenterToViewProtocol?

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

    func updateHomeView() {
        fetchNews()
    }
    
    func fetchNews() {
        // TODO Move boilerplate code
        let session = URLSession.shared
        let url = URL(string: Constants.request_url)!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        if let status = json["status"] as? String, status == "ok" {
                            if let content = json["articles"] as? [[String:String]] {
                                var array = Array<NewsModel>()
                                for item in content {
                                    let decoder = JSONDecoder()
                                    let jsonData = try JSONSerialization.data(withJSONObject: item)
                                    let newsModel = try decoder.decode(NewsModel.self, from: jsonData)
                                    array.append(newsModel)
                                }
                                self.homeView?.fetchNews(news: array)
                            }
                        }
                    }
                } catch {
                    print(error)
                    self.homeView?.fetchingNewsFailedWithError(error: error)
                }
            }
        }).resume()
    }
}
