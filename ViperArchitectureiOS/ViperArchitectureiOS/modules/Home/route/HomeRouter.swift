//
//  HomeRouter.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 03/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomeRouter: PresenterToRouterProtocol {
    static func createModule() -> UIViewController {
        let view = appDelegate().storyboard().instantiateViewController(withIdentifier: String(describing: HomeViewController.self)) as? HomeViewController
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = HomePresenter()
        let interactor: PresenterToInteractorProtocol = HomeInteractor()
        let router: PresenterToRouterProtocol = HomeRouter()
        
        view?.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view!
    }
    

}
