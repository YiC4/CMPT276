//
//  File.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/4.
//  Copyright © 2018年 Nurture. All rights reserved.
//

import UIKit

class AlertController {
    static func showAlert(_ inViewController: UIViewController, title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        inViewController.present(alert,animated: true ,completion: nil)
    }
    
}
