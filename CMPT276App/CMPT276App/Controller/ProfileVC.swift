//
//  ProfileVC.swift
//  CMPT276App
//
//  Created by Lcy on 2018/7/13.
//  Copyright © 2018年 Nurture. All rights reserved.
//  Usage: generate user page and send email

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
    
    //set user page
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
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //send email
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
        mailComposerVC.setMessageBody("How are you doing?", isHTML: false)
        if let filepath = Bundle.main.path(forResource: "swift", ofType: "pdf"){
            print("File path loaded.")
            if let fileData = NSData(contentsOfFile: filepath) {
                print("File data loaded.")
                mailComposerVC.addAttachmentData(fileData as Data, mimeType: "application/pdf", fileName: "test")
            }
        }
        return mailComposerVC
        
    }
    
    //retuen warning when meet error
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
