//
//  Hud.swift
//  MVVMArchitectureiOS
//
//  Created by Atif on 08/09/2019.
//  Copyright © 2019 Atif. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addHud(view: UIView) {
        self.frame = CGRect.init(x: 10, y: 10, width: 100, height: 100)
        self.backgroundColor = .lightGray
        self.layer.cornerRadius = 10.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.layer.shadowColor = UIColor.black.cgColor
        
        let hudActivity = UIActivityIndicatorView(style: .whiteLarge)
        hudActivity.startAnimating()
        hudActivity.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(hudActivity)
        
        NSLayoutConstraint.activate([
            hudActivity.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            hudActivity.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
        
        view.addSubview(self)
        self.center = view.center
    }
    
    func removeHUD() {
        self.removeFromSuperview()
    }
}
