//
//  HomeRouter.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 03/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol {
    static func createHomeModule() -> UIViewController {
        let navCont = appDelegate().storyboard().instantiateViewController(withIdentifier: "HomeNavigationController")
        if let view = navCont.children.first as? HomeViewController {
            //let view = appDelegate().storyboard().instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController
            let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
            let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
            let router: HomePresenterToRouterProtocol = HomeRouter()
            
            view.presenter = presenter
            presenter.homeView = view
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return navCont
        }
        return UIViewController()
    }
    
    func showDetail(from view: HomePresenterToViewProtocol, forPost news: NewsModel) {
        let detailVC = DetailRouter.createDetailModule(news: news)
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

