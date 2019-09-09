//
//  DetailViewController.swift
//  MVCArchitectureiOS
//
//  Created by Atif on 09/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var imagView: UIImageView!
    
    var item: NewsModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDtaa()
    }
    
    private func updateDtaa() {
        lblTitle.text = item?.title
        lblDescription.text = item?.description
        lblAuthor.text = item?.author
        imagView?.image(url: (item?.urlToImage)!)
    }
}

