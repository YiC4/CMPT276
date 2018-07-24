//
//  ProfileVC.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/13.
//  Copyright © 2018年 Nurture. All rights reserved.
//

import UIKit
import MessageUI
import Firebase
import FirebaseAuth
import FirebaseStorage

class ProfileVC: UIViewController, MFMailComposeViewControllerDelegate {

    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!

    var getUserName = String()
    var getUserImg = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            
            //load username
            let username = value?["username"] as? String
            self.userName.text! = username!
            
            //load userImg
            let urlKey = value?["userImg"] as? String
            if let url = URL(string: urlKey!){
                do {
                    let data = try Data(contentsOf: url)
                    self.userImg.image = UIImage(data: data)!
                }catch {
                    print(" Error ")
                }
            }
            
            
            
        }) { (error) in
            print(error.localizedDescription)
        }
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func createPDF(_ sender: Any) {
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
    
    
    
    @IBAction func sendEmail(_ sender: Any) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail(){
            self.present(mailComposeViewController, animated: true, completion: nil)
        }else{
            showMailError()
        }
        
    }
    
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        mailComposerVC.setToRecipients([""])
        mailComposerVC.setSubject("Hello")
        mailComposerVC.setMessageBody("How are yuo doing?", isHTML: false)
        if let filepath = Bundle.main.path(forResource: "swift", ofType: "application/pdf"){
            print("File path loaded.")
            if let fileData = NSData(contentsOfFile: filepath) {
                print("File data loaded.")
                mailComposerVC.addAttachmentData(fileData as Data, mimeType: "application/pdf", fileName: "test")
            }
        }
        return mailComposerVC
    
    }
    
    func showMailError(){
        let sendMailErrorAlert = UIAlertController(title: "Could not send email", message:"Your device could not send email",preferredStyle: .alert)
        let dismiss = UIAlertAction(title:"OK", style: .default, handler: nil)
        sendMailErrorAlert.addAction(dismiss)
        self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
