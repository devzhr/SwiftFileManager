//
//  ViewController.swift
//  Example-SwiftFileManager
//
//  Created by zouhair on 09/09/2020.
//  Copyright © 2020 devzhr. All rights reserved.
//

import UIKit
import SwiftFileManager

class ViewController: UIViewController {

    @IBAction func lookForSandBox(_ sender: UIButton) {
                
        let VC = WXXFileListViewController()
        let nav = UINavigationController.init(rootViewController: VC)
        nav.navigationBar.isTranslucent = false
        self.present(nav, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        }
}



