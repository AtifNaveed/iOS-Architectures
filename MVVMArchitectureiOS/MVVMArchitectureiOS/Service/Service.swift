//
//  APIRequest.swift
//  MVVMArchitectureiOS
//
//  Created by Atif on 08/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

protocol HomeViewModelProtocol: class {
    func fetchNews(news: [NewsModel])
    func fetchingNewsFailedWithError(error: Error)
}

class Service: NSObject {
    weak var delegate: HomeViewModelProtocol?
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
                                self.delegate?.fetchNews(news: array)
                            }
                        }
                    }
                } catch {
                    print(error)
                    self.delegate?.fetchingNewsFailedWithError(error: error)
                }
            }
        }).resume()
    }
}
