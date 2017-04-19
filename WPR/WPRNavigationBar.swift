//
//  WPRNavigationBar.swift
//  WPR
//
//  Created by Willis Allstead on 2/17/17.
//  Copyright © 2017 Willis Allstead. All rights reserved.
//

import UIKit

class WPRNavigationBar: UINavigationBar {
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        didLoad()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        didLoad()
    }
    
    func didLoad() {
        //Place your initialization code here
//        barStyle = .black
//        let navigationItem = UINavigationItem()
//        navigationItem.title = "Title"
//        pushItem(navigationItem, animated: false)
//        print(topItem)
        
        let navigationItem = UINavigationItem(title: "testtsts")
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
        
        
        pushItem(navigationItem, animated: false)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: self.superview!.frame.size.width, height: 95)
    }
}

