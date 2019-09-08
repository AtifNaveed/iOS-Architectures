//
//  DetailPresenter.swift
//  MVPArchitectureiOS
//
//  Created by Atif on 05/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit


// Detail View To Detail Presenter & viceversa
protocol DetailPresenterToViewProtocol: class {
    func showDetail(forPost news: NewsModel)
}
protocol DetailViewToPresenterProtocol: class {
    var detailView: DetailPresenterToViewProtocol? {get set}
    var news: NewsModel? { get set }
    func updateDetailView()
}

class DetailPresenter:DetailViewToPresenterProtocol {
    var detailView: DetailPresenterToViewProtocol?
    
    var news: NewsModel?
    
    func updateDetailView() {
        detailView?.showDetail(forPost: news!)
    }
}
