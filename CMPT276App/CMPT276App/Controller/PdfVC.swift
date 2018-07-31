//
//  PdfVC.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/24.
//  Copyright © 2018 Nurture. All rights reserved.
//  Usage: generate pdf file

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class PdfVC: UIViewController {
    @IBOutlet weak var web_view: UIWebView!
    var count: Int = 0
    var html : String = ""
    var UserID : [String] = []
    var MealTitle : [String] = []
    var Date : [String] = []
    var Trimester : [String] = []
    var MealImg : [String] = []
    
    var Bloating : [Bool] = []
    var Fatigue : [Bool] = []
    var Swollenbreasts  : [Bool] = []
    var Morningsickness : [Bool] = []
    var Moodswings  : [Bool] = []
    var Frequenturination  : [Bool] = []
    var Spotting : [Bool] = []
    var Foodaversion : [Bool] = []
    var Cravings : [Bool] = []
    var Backpain : [Bool] = []
    
    //get mealLog data
    func fetch(){
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).child("mealLog").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get meallog value
            let value = snapshot.value as? NSDictionary
            self.count = value!.count
            let test = value.unsafelyUnwrapped
            let keyArray = test.allKeys as! [String]
            for i in 0..<self.count {
                let test1 = test.value(forKey: keyArray[i]) as? NSDictionary
                self.MealTitle.append(test1!.value(forKey: "MealTitle") as! String)
                self.Date.append(test1!.value(forKey: "Date") as! String)
                self.Trimester.append(test1!.value(forKey: "Trimester") as! String)
                self.MealImg.append(test1!.value(forKey: "MealImg") as! String)
                self.Bloating.append(test1!.value(forKey: "Bloating") as! Bool)
                self.Fatigue.append(test1!.value(forKey: "Fatigue") as! Bool)
                self.Swollenbreasts.append(test1!.value(forKey: "Swollenbreasts") as! Bool)
                self.Morningsickness.append(test1!.value(forKey: "Morningsickness") as! Bool)
                self.Moodswings.append(test1!.value(forKey: "Moodswings") as! Bool)
                self.Frequenturination.append(test1!.value(forKey: "Frequenturination") as! Bool)
                self.Spotting.append(test1!.value(forKey: "Spotting") as! Bool)
                self.Foodaversion.append(test1!.value(forKey: "Foodaversion") as! Bool)
                self.Cravings.append(test1!.value(forKey: "Cravings") as! Bool)
                self.Backpain.append(test1!.value(forKey: "Backpain") as! Bool)
                
            }
            
            
            // ...
        })
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    }
  
    //set html string
    func get(){
        html = "<b>Welcome to  <i> Nurture!</i></b> <p><h1><font color='red'> </font></h1></p>"
        var temp : String
        for i in 0..<self.count
        {   
            html += "<b>"
            
            html += "MealTitle: <font color='red'>"
            temp = MealTitle[i]
            html += temp
            html += "  </font>"
            html += ".  "
            
            html += "Date: <font color='red'>"
            temp = Date[i]
            html += temp
            html += "  </font>"
            html += ".  "
            
            html += "Trimester: <font color='red'>"
            temp = Trimester[i]
            html += temp
            html += "  </font>"
            html += ".  "
            
            if Bloating[i] == true
            {
                html += "Bloating: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Bloating: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            if Fatigue[i] == true
            {
                html += "Fatigue: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Fatigue: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            if Swollenbreasts[i] == true
            {
                html += "Swollenbreasts: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Swollenbreasts: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            if Morningsickness[i] == true
            {
                html += "Morningsickness: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Morningsickness: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            if Moodswings[i] == true
            {
                html += "Moodswings: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Moodswings: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            if Frequenturination[i] == true
            {
                html += "Frequenturination: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Frequenturination: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            if Spotting[i] == true
            {
                html += "Spotting: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Spotting: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            if Foodaversion[i] == true
            {
                html += "Foodaversion: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Foodaversion: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            if Cravings[i] == true
            {
                html += "Cravings: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Cravings: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            if Backpain[i] == true
            {
                html += "Backpain: <font color='red'>"
                html += "Yes"
                html += "  </font>"
                html += ".  "
            }else{
                html += "Backpain: <font color='red'>"
                html += "No"
                html += "  </font>"
                html += ".  "
            }
            
            
            html += "</b>"
            html += "<br>"
            html += "<br>"
        }
        let frmt = UIMarkupTextPrintFormatter(markupText: self.html)
        
        
        
        //  set print format
        
        let render = UIPrintPageRenderer()
        
        render.addPrintFormatter(frmt, startingAtPageAt: 0)
        
        //  Create Paper Size for print
        
        let page = CGRect(x: 0, y: 0, width: 595.2, height: /*841.8*/2000)
        let printable = page.insetBy(dx: 0, dy: 0)
        
        render.setValue(NSValue(cgRect: page), forKey: "paperRect")
        render.setValue(NSValue(cgRect: printable), forKey: "printableRect")
        
        // 4. Create PDF context and draw
        
        let filedata = NSMutableData()
        UIGraphicsBeginPDFContextToData(filedata, CGRect.zero, nil)
        
        for i in 1...render.numberOfPages {
            
            UIGraphicsBeginPDFPage();
            let bounds = UIGraphicsGetPDFContextBounds()
            render.drawPage(at: i - 1, in: bounds)
        }
        
        UIGraphicsEndPDFContext();
        
        // 5. Save PDF file
        
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        filedata.write(toFile: "\(documentsPath)/myfile.pdf", atomically: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func ganarate_pdf(filename:String){
        
        
        
    }
    
    @IBAction func generatePDF(_ sender: UIButton) {
        get()
        let file = "myfile"
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = "\(documentsPath)/\(file).pdf"
        let url = URL(fileURLWithPath: filePath)
        
        let urlRequest = URLRequest(url: url)
        web_view.loadRequest(urlRequest)
    }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


