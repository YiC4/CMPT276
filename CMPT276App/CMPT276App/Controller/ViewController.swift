//
//  ViewController.swift
//
//
//  Created by Lcy on 2018/7/1.
//  Copyright © 2018年 Lcy. All rights reserved.
//
//  Usage: View controller is the log in screen

import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var userUid: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailField.delegate = self
        self.passwordField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        return(true)
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: "user"){
            goToJourneyVC()
        }
    }
    
    func goToCreateUserVC(){
        performSegue(withIdentifier: "SignUp", sender: nil)
    }
    
    func goToJourneyVC() {
        performSegue(withIdentifier: "SignIn", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SignUp" {
            if let destination = segue.destination as? UserVC {
                if userUid != nil {
                    destination.userUid = userUid
                }
                if emailField.text != nil {
                    destination.emailField = emailField.text
                }
                if passwordField.text != nil {
                    destination.passwordField = passwordField.text
                }
            }
        }
    }
    
    
    @IBAction func signInTapped(_ sender: Any){
        let email = emailField.text
        let password = passwordField.text
        if email != "" && password != ""{
            Auth.auth().signIn(withEmail: email!, password: password!, completion:
                { (user,error) in
                if error == nil {
                    if let user = user {
                        self.userUid = user.user.uid
                        self.goToJourneyVC()
                    }
                } else {
                    AlertController.showAlert(self, title: "Error", message: error!.localizedDescription)
                }

            });
        }  else {
            AlertController.showAlert(self, title: "Missing Info", message: "Please fill out all fields")
        }
    }
    
    
}


