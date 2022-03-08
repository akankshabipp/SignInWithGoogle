//
//  ViewController.swift
//  SignInWithGoogle
//
//  Created by admin on 24/02/22.
//

import UIKit
import GoogleSignIn
import Firebase

class ViewController: UIViewController {
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    func google(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

          if let error = error {
            // ...
            return
          }

          guard
            let authentication = user?.authentication,
            let idToken = authentication.idToken
          else {
            return
          }

          let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                         accessToken: authentication.accessToken)

          // ...
            Auth.auth().signIn(with: credential) { authResult, error in
                if let _ = error {
                    print("error")
                  // ...
                  return
                }
                else{
                    print("user email:\(authResult?.user.email)")
                  
                }
                // User is signed in
                // ...
            }
        }
    }
    @IBAction func signInAction(_ sender: Any) {
        google()
        
        
        //spaces added
    }
    

}

