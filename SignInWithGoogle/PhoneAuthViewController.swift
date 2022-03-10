//
//  PhoneAuthViewController.swift
//  SignInWithGoogle
//
//  Created by admin on 08/03/22.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class PhoneAuthViewController: UIViewController {
    
    @IBOutlet weak var txtFieldPhoneNumber: UITextField!
    @IBOutlet weak var mobileNumber: UITextField!
    @IBOutlet weak var txtFieldFirstNumber: UITextField!
    @IBOutlet weak var txtFieldSecondNumber: UITextField!
    
    @IBOutlet weak var txtFieldThirdNumber: UITextField!
    
    @IBOutlet weak var txtFieldFourthNumber: UITextField!
    
    @IBOutlet weak var txtFieldFifthNumber: UITextField!
    
    @IBOutlet weak var txtFieldSixthNumber: UITextField!
    
    @IBOutlet weak var stckView: UIStackView!
    
    var verification_id: String? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // txtFieldPhoneNumber.delegate = self
        //stckView.isHidden = true
        txtFieldFirstNumber.isHidden = true
    }
    
    @IBAction func btnActionVerify(_ sender: Any) {
        if (txtFieldFirstNumber.isHidden){
//            let mobileNumber =  txtFieldPhoneNumber.text!.trimmingCharacters(in: .whitespaces)
//            if mobileNumber.isEmpty {
//                print("Enter mobile number")
//            }
            if !txtFieldPhoneNumber.text!.isEmpty {
                PhoneAuthProvider.provider().verifyPhoneNumber(txtFieldPhoneNumber.text!, uiDelegate: nil, completion: {
                    verificationID, error in
                    if (error != nil ){
                        print(error.debugDescription)
                    }
                    else{
                        self.verification_id = verificationID
                        self.txtFieldFirstNumber.isHidden = false
                    }
                })
            }
            
            
//            else {
//            //    Auth.auth().settings?.isAppVerificationDisabledForTesting = true
//                PhoneAuthProvider.provider().verifyPhoneNumber(txtFieldPhoneNumber.text!, uiDelegate: nil, completion: { verificationID, error in
//                    if (error != nil){
//                      return
//                    }
////                    if error != nil {
////                        if let error = AuthErrorCode(rawValue: error?.code) {
////                            switch error {
////                            case .wrongPassword:
////                                // do some stuff with the error code
////                            }
////                    }
//                    else {
//                        self.verification_id = verificationID
//                        self.txtFieldFirstNumber.isHidden = false
//                    }
//                })
//            }
            else  {
                print("Please Enter Mobole number")
            }
        
        }else {
            if self.verification_id != nil {
                let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.verification_id!, verificationCode: txtFieldFirstNumber.text!)
                Auth.auth().signIn(with: credential, completion: {authData, error in
                    if (error != nil){
                        print(error.debugDescription)
                    }
                    else {
                        print("Authentication success" + (authData?.user.phoneNumber! ?? "no number"))
                    }
                })
            }
            else {
                print("Error in getting verification Id")
            }
            
        }
        
    }
}
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        txtFieldPhoneNumber.resignFirstResponder()
//
//        if let text = txtFieldPhoneNumber.text, !text.isEmpty {
//            let number = "+1\(text)"
//            AuthManager.shared.startAuth(phoneNumber: number) {[weak self] success in
//                guard success else {
//                    return
//                }
//                DispatchQueue.main.async {
//                    //enter code
//                }
//            }
//        }
//        return true
//    }
//}
