//
//  HomeInteractor.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 03/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomeInteractor: HomePresenterToInteractorProtocol {
    var presenter: HomeInteractorToPresenterProtocol?
    
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
                                    //decoder.dateDecodingStrategy = .iso8601
                                    let jsonData = try JSONSerialization.data(withJSONObject: item)
                                    //let jsonString = String(data: jsonData, encoding: .utf8)
                                    let newsModel = try decoder.decode(NewsModel.self, from: jsonData)
                                    //print(newsModel.author!)
                                    array.append(newsModel)
                                }
                                self.presenter?.fetchNewsData(news: array)
                            }
                        }
                    }
                } catch {
                    print(error)
                    self.presenter?.fetchingNewsFailedWithError(error: error)
                }
            }
        }).resume()
    }
    
}

