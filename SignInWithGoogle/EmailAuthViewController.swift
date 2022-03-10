//
//  EmailAuthViewController.swift
//  SignInWithGoogle
//
//  Created by admin on 10/03/22.
//

import UIKit
import FirebaseAuth

class EmailAuthViewController: UIViewController {
    @IBOutlet weak var txtFldEmail: UITextField!
    
    @IBOutlet weak var txtFldPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var txtFEmailRegister: UITextField!
    
    @IBOutlet weak var txtFPasswordRegister: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.addTarget(self, action: #selector(tapForLogin), for: .touchUpInside)
       
    }
    
    
    @objc private func tapForLogin(){
        Auth.auth().signIn(withEmail: txtFldEmail.text!, password: txtFldPassword.text!) { authResult, error in
            if error != nil{
                print(error?.localizedDescription ?? "Exception")
            }else{
                print("login - \(String(describing: authResult?.user.email))")
            }
          // ...
        }
    }
    
    @IBAction func btnRegisterUser(_ sender: Any) {
        Auth.auth().createUser(withEmail: txtFEmailRegister.text!, password: txtFPasswordRegister.text!) { authResult, error in
            if error != nil{
                print(error?.localizedDescription ?? "Exception")
            }else{
                print("Register - \(String(describing: authResult?.user.email))")
            }
          // ...
        }
    }
    
    
}
