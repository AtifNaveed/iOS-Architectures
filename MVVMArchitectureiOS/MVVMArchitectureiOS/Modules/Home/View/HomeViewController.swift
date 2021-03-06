//
//  HomeViewController.swift
//  MVVMArchitectureiOS
//
//  Created by Atif on 08/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    let vm = HomeViewModel()
    let api = Service()
    var hud = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        observerBinding()
        apiRequest()
    }
    private func setUp() {
        hud.addHud(view: self.view)
    }
    private func observerBinding() {
        tableView.dataSource = vm
        tableView.delegate = vm
    }
    private func apiRequest() {
        api.delegate = self
        api.apiRequest()
    }
 }

extension HomeViewController: ServiceProtocol {
    func apiRespondSuccessfully(news: [NewsModel]) {
        vm.data.addAndNotify(observer: self) { [weak self] in
            DispatchQueue.main.async {
                self?.vm.refreshWith(data: news, {
                    self?.tableView.reloadData()
                })
                self?.hud.removeHUD()
            }
        }
    }
    func apiRequestFailedWithError(error: Error) {
        print(error)
    }
}
