//
//  UserVC.swift
//
//
//  Created by Lcy on 2018/7/2.
//  Editor: Melissa Lee
//  Copyright © 2018年 Lcy. All rights reserved.
//
//  Usage: Creating new user

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import SwiftKeychainWrapper

class UserVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var userImagePicker: UIImageView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var completeSignInBtn: UIButton!
    
    var userUid: String!
    var emailField: String!
    var passwordField: String!
    var imagePicker : UIImagePickerController!
    var imageSelected = false
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.usernameField.delegate = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        // Do any additional setup after loading the view.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameField.resignFirstResponder()
        return(true)
    }
    
    //Save user id for screen to go straight to journey logs
    func keychain(){ //TODO: MAKE THIS MORE FUNCTIONAL
        //KeychainWrapper.standard.set(emailField, forKey: "uid")
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            userImagePicker.image = image
            imageSelected = true
        } else {
            print("image wasn't selected")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    func setUpUser(img: String){
        let userData = [
            "username": username!,
            "userImg": img,
            "mealLog": "..."
        ]
        keychain()
        let setLocation = Database.database().reference().child("users").child(Auth.auth().currentUser!.uid)
        setLocation.setValue(userData)
    }
    
    //Upload Image for Firebase Account
    func uploadImg() {
        if usernameField.text == nil {
            print("must have username")
            completeSignInBtn.isEnabled = false
        } else {
            username = usernameField.text
            completeSignInBtn.isEnabled = true
        }
        guard let img = userImagePicker.image, imageSelected == true else {
            print("image must be selected")
            return
        }
        
        if let imgData = UIImageJPEGRepresentation(img, 0.2) {
            let imgUid = NSUUID().uuidString
            let metadata = StorageMetadata()
            metadata.contentType = "img/jpeg/png"
            
            let storageItem = Storage.storage().reference().child(imgUid)
            storageItem.putData(imgData, metadata: metadata) {
                (metadata, error) in
                if error != nil {
                    print("Couldn't upload Image")
                } else {
                    print("Uploaded")
                    storageItem.downloadURL(completion: { (url, error) in
                        if error != nil {
                            print(error!)
                            return
                        }
                        if url != nil {
                            self.setUpUser(img: url!.absoluteString)
                        }
                    })
                }
            }
        }
    }
    
    //Completed Account - Create Firebase User
    @IBAction func compeleteAccount(_ sender: Any){
        Auth.auth().createUser(withEmail: emailField, password: passwordField, completion: {(user, error) in
            if error != nil {
                print("cant create userString(describing: error)")
            }else {
                if let user = user {
                    self.userUid = user.user.uid
                }
            }
            self.uploadImg()
        })
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectedImagePicker(_ sender: Any){
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func cancel(_ sender: AnyObject){
        dismiss(animated: true, completion: nil)
    }


}
