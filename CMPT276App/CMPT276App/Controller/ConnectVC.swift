//
//  ConnectVC.swift
//  CMPT276App
//
//  Created by Michael Lee on 2018-06-27.
//  Copyright © 2018 Nurture. All rights reserved.
//

import UIKit

class ConnectVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        }
    
    func getUsersData(){
        //TODO: GET A USER'S NAME TO POST IN FORUM
        //HOW: INCLUDE THE KEYCHAIN AND FORCE UNWRAP THEIR USERNAME/PASS
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ShareSomethingCell")
            as? ShareSomethingCell{
                cell.configCell()
                cell.shareBtn.addTarget(self, action: #selector(toCreatePost), for: .touchUpInside)
                return cell
            }
        }
        return UITableViewCell()
    }
    
    @objc func toCreatePost(_ sender: AnyObject){
            performSegue(withIdentifier: "toCreatePost", sender: nil)
    }
    
    func getPosts(){//TODO: FINISH IMPLEMENTING THIS WHEN DATABASE IS UP
        //Database.database().reference().child("posts").observeSingleEvent(of: .value){
        //(snapshot) in code
        //guard let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] else{return}
        //...
        
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
