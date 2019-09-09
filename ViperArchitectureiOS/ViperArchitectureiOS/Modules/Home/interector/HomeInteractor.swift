//
//  HomeInteractor.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 03/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomeInteractor: HomePresenterToInteractorProtocol, ServiceProtocol {
    var presenter: HomeInteractorToPresenterProtocol?
    var service: Service?
    
    func fetchNews() {
        service = Service()
        service?.delegate = self
        service?.apiRequest()
    }
    func apiRespondSuccessfully(news: [NewsModel]) {
        self.presenter?.fetchNewsData(news: news)
    }
    func apiRequestFailedWithError(error: Error) {
        self.presenter?.fetchingNewsFailedWithError(error: error)
    }
}

