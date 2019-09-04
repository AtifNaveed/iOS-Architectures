//
//  HomeViewController.swift
//  VIPER (View-Interactor-Presentor-Entity-Router)
//
//  Created by Atif on 02/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var presenter: ViewToPresenterProtocol?
    var dataArray: [NewsModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.updateView()
        //tableView.tableFooterView = UIView()
    }
}

extension HomeViewController: PresenterToViewProtocol {
    func loadNews(news: [NewsModel]) {
        dataArray = news
        //print(dataArray)
        //tableView.reloadData()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func loadingFailed() {
        print("Failed")
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as! HomeTableViewCell
        let news = dataArray[indexPath.row]
        cell.data(forRow: news)
        return cell
    }
    
    
}
