//
//  HomeViewModel.swift
//  MVVMArchitectureiOS
//
//  Created by Atif on 08/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class DynamicDataSource<T>: NSObject {
    var data: Observable<[T]> = Observable([])
    var dataArray = [NewsModel]()
    
    func refreshWith(data: Array<NewsModel>, _ completionBlock : @escaping ()->()) {
        self.dataArray = data
        completionBlock()
    }
}

class HomeViewModel: DynamicDataSource<NewsModel>, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeTableViewCell.self), for: indexPath) as! HomeTableViewCell
        cell.data(forRow: dataArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = appDelegate().storyboard().instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as? DetailViewController else { return }
        vc.item = dataArray[indexPath.row]
        appDelegate().rootNavigation().pushViewController(vc, animated: true)
    }
}






