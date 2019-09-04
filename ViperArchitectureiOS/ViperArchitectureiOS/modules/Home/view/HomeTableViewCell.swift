//
//  HomeTableViewCell.swift
//  ViperArchitectureiOS
//
//  Created by Atif on 04/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imagView: UIImageView!

    func data(forRow news: NewsModel) {
        self.selectionStyle = .none
        lblTitle?.text = news.title
        lblDescription?.text = news.description
        lblAuthor?.text = "\"\(news.author)\""
        imagView?.image(url: news.urlToImage)
    }
}
