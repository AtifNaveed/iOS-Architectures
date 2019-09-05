//
//  DetailRouter.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 04/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class DetailRouter: DetailPresenterToRouterProtocol {
    static func createDetailModule(news: NewsModel) -> UIViewController {
        let view = appDelegate().storyboard().instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController
        let presenter: DetailViewToPresenterProtocol & DetailInteractorToPresenterProtocol = DetailPresenter()
        let interactor: DetailPresenterToInteractorProtocol = DetailInteractor()
        let router: DetailPresenterToRouterProtocol = DetailRouter()
        
        view?.presenter = presenter
        presenter.detailView = view
        presenter.news = news
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view!
    }
}
