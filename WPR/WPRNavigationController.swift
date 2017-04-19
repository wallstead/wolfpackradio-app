//
//  WPRNavigationController.swift
//  WPR
//
//  Created by Willis Allstead on 2/17/17.
//  Copyright © 2017 Willis Allstead. All rights reserved.
//

import Foundation
import UIKit

class WPRNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewWillAppear(_ animated: Bool) {
        navigationBar.barStyle = .default
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 81, height: 81))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "WPR-Logo-Large")
        imageView.image = image
        let logo = UINavigationItem()
        logo.titleView = imageView
        
        navigationBar.pushItem(logo, animated: false)
        
    }
    
}
