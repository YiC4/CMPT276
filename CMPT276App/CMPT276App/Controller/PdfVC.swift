//
//  PdfVC.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/24.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit

class PdfVC: UIViewController {

    @IBOutlet weak var lbl_name: UILabel!
    @IBOutlet weak var web_view: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // create html code
        let html = "<b>Welcome <i>World!</i></b> <p><h1><font color='red'>This  is PDF file In swift 3.0</font></h1></p>"
        let frmt = UIMarkupTextPrintFormatter(markupText: html)
        
        //  set print format
        
        let render = UIPrintPageRenderer()
        render.addPrintFormatter(frmt, startingAtPageAt: 0)
        
        //  Create Paper Size for print
        
        let page = CGRect(x: 0, y: 0, width: 595.2, height: 841.8)
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
        
        // 5. Save PDF file you can also save this file by using another button
        
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        
        filedata.write(toFile: "\(documentsPath)/myfile.pdf", atomically: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Button on view for show the file  in webview
    @IBAction func Ganratepdf(_ sender: UIButton)
    {
        let file = "myfile"
        self.ganarate_pdf(filename: file)
    }
    
    func ganarate_pdf(filename:String)
    {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = "\(documentsPath)/\(filename).pdf"
        let url = URL(fileURLWithPath: filePath)
        
        let urlRequest = URLRequest(url: url)
        web_view.loadRequest(urlRequest)
        
        
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
