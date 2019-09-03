//
//  HomeViewController.swift
//  VIPER (View-Interactor-Presentor-Entity-Router)
//
//  Created by Atif on 02/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var presenter: ViewToPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.updateView()
    }
}

extension HomeViewController: PresenterToViewProtocol {
    func loadNews(news: [NewsModel]) {
        print(news)
    }
    
    func loadingFailed() {
        print("Failed")
    }
    
    
}
