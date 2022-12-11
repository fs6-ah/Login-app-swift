//
//  ViewController.swift
//  login
//
//  Created by FS6 on 10/12/2022.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var msgshow: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    let db = Firestore.firestore()
    func loginawdaw(){
        Auth.auth().signIn(withEmail: self.username.text!, password: self.password.text!) { (user, error) in
            if user != nil {
                self.msgshow.text = "Login Successful"
                self.home()
            } else {
                self.msgshow.text = " Email or Pass field "
            }
        }
    }

    @IBAction func singin(_ sender: Any) {
        loginawdaw()
    }
    func home(){
        view.endEditing(true)
        let vs = storyboard?.instantiateViewController(identifier: "home") as! homeViewController
        vs.modalPresentationStyle = .fullScreen
        present(vs, animated: true)
    }
    @IBAction func singup(_ sender: Any) {
        view.endEditing(true)
        let vs = storyboard?.instantiateViewController(identifier: "reg") as! registerViewController
        vs.modalPresentationStyle = .fullScreen
        present(vs, animated: true)
    }
    
}

