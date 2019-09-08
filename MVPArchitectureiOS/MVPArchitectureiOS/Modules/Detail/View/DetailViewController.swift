//
//  DetailViewController.swift
//  MVPArchitectureiOS
//
//  Created by Atif on 05/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imagView: UIImageView!
    
    var presenter: DetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateDetailView()
    }
}

extension DetailViewController: DetailPresenterToViewProtocol {
    func showDetail(forPost news: NewsModel) {
        lblTitle?.text = news.title
        lblDescription?.text = news.description
        lblAuthor?.text = "\"\(news.author)\""
        imagView?.image(url: news.urlToImage)
    }
}
