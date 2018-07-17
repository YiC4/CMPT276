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
    
    var getBloating = Bool()
    var getFatigue = Bool()
    var getSwollenbreasts = Bool()
    var getMorningsickness = Bool()
    var getFrequenturination = Bool()
    var getSpotting = Bool()
    var getFoodaversion = Bool()
    var getCravings = Bool()
    var getBackpain = Bool()
    
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
        //        todo: add symptoms
//        symptomD.text! = "Symptoms:"
//        if getBloating == true {symptomD.text! = symptomD.text! + " Bloating"}
//        if getFatigue == true {symptomD.text! = symptomD.text! + " Fatigue"}
//        if getSwollenbreasts == true {symptomD.text! = symptomD.text! + " Swollenbreasts"}
//        if getMorningsickness == true {symptomD.text! = symptomD.text! + " Morningsickness"}
//        if getFrequenturination == true {symptomD.text! = symptomD.text! + " Frequenturination"}
//        if getSpotting == true {symptomD.text! = symptomD.text! + " Spotting"}
//        if getFoodaversion == true {symptomD.text! = symptomD.text! + " Foodaversion"}
//        if getCravings == true {symptomD.text! = symptomD.text! + " Cravings"}
//        if getBackpain == true {symptomD.text! = symptomD.text! + " Backpain"}
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
