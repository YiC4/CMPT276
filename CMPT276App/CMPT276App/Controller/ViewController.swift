//
//  ViewController.swift
//  P
//
//  Created by Lcy on 2018/7/1.
//  Copyright © 2018年 Lcy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var userUid: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: "uid"){
            goToJourneyVC()
        }
    }
    
    func goToCreateUserVC(){
        performSegue(withIdentifier: "SignUp", sender: nil)
    }
    
    func goToJourneyVC() {
        performSegue(withIdentifier: "ToFeed", sender: nil)
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
        if let email = emailField.text, let password = passwordField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion:
                { (user,error) in
                if error == nil {
                    if let user = user {
                        self.userUid = user.user.uid
                        self.goToJourneyVC()
                    }
                } else {
                    self.goToCreateUserVC()
                }

            });
        }
    }
    
    
}


