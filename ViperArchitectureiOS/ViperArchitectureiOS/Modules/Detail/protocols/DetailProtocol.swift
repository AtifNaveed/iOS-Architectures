//
//  DetailProtocol.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 04/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

// Detail View To Detail Presenter & viceversa
protocol DetailPresenterToViewProtocol: class {
    func showDetail(forPost news: NewsModel)
}
protocol DetailViewToPresenterProtocol: class {
    var detailView: DetailPresenterToViewProtocol? {get set}
    var interactor: DetailPresenterToInteractorProtocol? {get set}
    var router: DetailPresenterToRouterProtocol? {get set}
    var news: NewsModel? { get set }
    func updateDetailView()
}

// Detail Interactor to Detail Presnter & viceversa
protocol DetailInteractorToPresenterProtocol: class {
    func showDetail(news: NewsModel)
}
protocol DetailPresenterToInteractorProtocol: class {
    var presenter: DetailInteractorToPresenterProtocol? {get set}
    func showDetail(forPost: NewsModel)
}

// Detail Presenter to Detail Router
protocol DetailPresenterToRouterProtocol: class {
    static func createDetailModule(news: NewsModel) -> UIViewController
}

