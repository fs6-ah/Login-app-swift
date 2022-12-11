//
//  homeViewController.swift
//  login
//
//  Created by FS6 on 11/12/2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class homeViewController: UIViewController {

    @IBOutlet weak var msg: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getinfo()

        // Do any additional setup after loading the view.
    }
    func getinfo(){
        let db = Firestore.firestore()
        guard let uid = Auth.auth().currentUser?.uid else {return}
        db.collection("users").document(uid)
            .addSnapshotListener { documentSnapshot, error in
              guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
              }
              guard let data = document.data() else {
                print("Document data was empty.")
                return
              }
                var username = (data["username"] as! String)
                self.msg.text! = "welcome " + username
            }
            
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
