//
//  registerViewController.swift
//  login
//
//  Created by FS6 on 10/12/2022.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth
class registerViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var nickname: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpass: UITextField!
    @IBOutlet weak var msgshow: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func reg(_ sender: Any) {
        if self.password.text == self.confirmpass.text {
            Auth.auth().createUser(withEmail: self.email.text!, password: self.password.text!) { (user, error) in
            if user != nil {
                let mail1 = self.email!.text
                let systemVersion = UIDevice.current.systemVersion
                let uuidp = UIDevice.current.identifierForVendor?.uuidString
                guard let userID = Auth.auth().currentUser?.uid else { return };          Firestore.firestore().collection("users").document(userID).setData([ "email" : self.email.text,"userid" : userID,"password" : self.password!.text, "username" : self.username!.text, "nickname" : self.nickname!.text])
                let alert2 = UIAlertController(title: "200", message: "تم انشاء الحساب بنجاح.", preferredStyle: UIAlertController.Style.alert)
                alert2.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert2, animated: true, completion: nil)
                print("Done")
            } else {
                let alert1 = UIAlertController(title: "404", message: "لا تستطيع التسجيل بالبريد الالكتروني هاذه.", preferredStyle: UIAlertController.Style.alert)
                alert1.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert1, animated: true, completion: nil)
            }
            }
        } else {
                 print("the password is Not the same")
             }    }
    
   
    @IBAction func singin(_ sender: Any) {
        view.endEditing(true)
        let vs = storyboard?.instantiateViewController(identifier: "login") as! ViewController
        vs.modalPresentationStyle = .fullScreen
        present(vs, animated: true)
    }
    
}
    
