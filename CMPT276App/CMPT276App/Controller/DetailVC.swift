//
//  DetailVC.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/15.
//  Copyright © 2018年 Nurture. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var getMeatTitle = String()
    var getDate = String()
    var getTrimester = String()
    var getImage = UIImage()
    var getSymptoms = String()
    
    @IBOutlet weak var mealTitleD: UILabel!
    @IBOutlet weak var dateD: UILabel!
    @IBOutlet weak var imageD: UIImageView!
    @IBOutlet weak var trimesterD: UILabel!
    @IBOutlet weak var symptomD: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        mealTitleD.text! = getMeatTitle
        dateD.text! = getDate
        imageD.image = getImage
        trimesterD.text! = "Trimester " + getTrimester
        symptomD.text! = getSymptoms
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
