//
//  DetailViewController.swift
//  MVVMArchitectureiOS
//
//  Created by Atif on 08/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imagView: UIImageView!
    
    let vm = DetailViewModel()
    var item: NewsModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observerBinding()
        loadItem()
    }
    private func observerBinding() {
        vm.title = { [weak self] value in
            self?.lblTitle.text = value
        }
        vm.descripton = { [weak self] value in
            self?.lblDescription.text = value
        }
        vm.author = { [weak self] value in
            self?.lblAuthor.text = value
        }
        vm.imageUrl = { [weak self] value in
              self?.imagView?.image(url: value)
        }
    }
    
    private func loadItem() {
        vm.loadItem(item: item!)
    }
}
