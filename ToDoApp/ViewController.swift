//
//  ViewController.swift
//  ToDoApp
//
//  Created by Eren Bağcı on 28.09.2022.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        emailText.text = "qwe@gmail.com"
        passwordText.text = "123456"
    
    }
        
    @IBAction func signInClicked(_ sender: Any) {
        if let email = emailText.text, let password = passwordText.text {
            Auth.auth().signIn(withEmail: email, password: password) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.performSegue(withIdentifier: "toListVC", sender: nil)
                }
            }
        } else {
            self.makeAlert(titleInput: "Error!", messageInput: "Username or Password?")
        }
    
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        if let email = emailText.text, let password = passwordText.text {
            Auth.auth().createUser(withEmail: email, password: password) { authdata, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                } else {
                    self.makeAlert(titleInput: "Başarılı", messageInput: "Kullanıcı Olulturuldu.")
                }
            }
        } else {
            self.makeAlert(titleInput: "Error", messageInput: "Username or Password ")
        }
    }
    
    
    func makeAlert(titleInput: String ,messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
