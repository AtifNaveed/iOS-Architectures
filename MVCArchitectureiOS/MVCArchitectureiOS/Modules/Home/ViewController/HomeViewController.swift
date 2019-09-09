//
//  HomeViewController.swift
//  MVCArchitectureiOS
//
//  Created by Atif on 09/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var dataArray = [NewsModel]()
    let api = Service()
    var hud = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        apiRequest()
    }
    private func setUp() {
        hud.addHud(view: self.view)
    }
    private func apiRequest() {
        api.delegate = self
        api.apiRequest()
    }
}

extension HomeViewController: ServiceProtocol {
    func apiRespondSuccessfully(news: [NewsModel]) {
        self.dataArray = news
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
            self?.hud.removeHUD()
        }
    }
    func apiRequestFailedWithError(error: Error) {
        print(error)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as! HomeTableViewCell
        cell.data(forRow: dataArray[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = appDelegate().storyboard().instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController else { return }
        vc.item = dataArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}


