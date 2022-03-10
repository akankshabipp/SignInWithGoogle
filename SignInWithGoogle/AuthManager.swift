//
//  AuthManager.swift
//  SignInWithGoogle
//
//  Created by admin on 08/03/22.
//

import Foundation
import FirebaseAuth

class AuthManager{
    static let shared = AuthManager()
    let auth = Auth.auth()
    private var verificationID: String?
    public func startAuth(phoneNumber:String, completion : @escaping (Bool) -> Void){
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { [weak self] verificationID, error in
            guard let verificationID = verificationID, error == nil else {
                completion(false)
                return
            }
            self?.verificationID = verificationID
            completion(true)
        }
    }
    public func verifyCode(smsCode:String, completion : @escaping (Bool) -> Void){
        guard let verificationID = verificationID else {
            completion(false)
            return
        }
        let credentials = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: smsCode)
        auth.signIn(with: credentials){ result, error in
            guard result != nil, error == nil else {
                completion(false)
                return
            }
            completion(true)
        }

    }
}
