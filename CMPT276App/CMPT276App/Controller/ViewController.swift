//
//  ViewController.swift
//
//
//  Created by Lcy on 2018/7/1.
//  Copyright © 2018年 Lcy. All rights reserved.
//


import UIKit
import Firebase
import FirebaseAuth
import SwiftKeychainWrapper

//  Usage: View controller is the log in screen
class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var userUid: String!
    
    //when we load in, we set the emailfield delegate and password delegate to this view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailField.delegate = self
        self.passwordField.delegate = self
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
    

    //if the user is signed in, take user to journey page
    override func viewDidAppear(_ animated: Bool) { //TODO: implement this to work
        if let _ = KeychainWrapper.standard.string(forKey: "user"){
            goToJourneyVC()
        }
    }
    
    func goToCreateUserVC(){
        performSegue(withIdentifier: "SignUp", sender: nil)
    }
    
    func goToJourneyVC() {
        performSegue(withIdentifier: "ToFeed", sender: nil)
    }
    
    //prepare to send the email and password to the userVC page
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
    
    //When the user taps 'sign in' it takes them to the journey page if they are registered
    //If the user did not have a profile, we create them one
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
                    self.goToCreateUserVC()
                }

            });
        }
    }
    
    
}


