//
//  AppDelegate.swift
//  SignInWithGoogle
//
//  Created by admin on 24/02/22.
//

import UIKit
import FirebaseCore
import GoogleSignIn
import FirebaseAuth


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    //var clientID = "803234011018-56dgjvnqo7fljjok0uscuopbjqetb5am.apps.googleusercontent.com"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        if Auth.auth().currentUser == nil {
            let vc = PhoneAuthViewController()
            let navVC = UINavigationController(rootViewController: vc)
          //  window.rootViewController = navVC
        }
        else {
            // rootview controller will Sigin user
        }
        return true
    }
  


    func application(_ application: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey: Any])
      -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
    
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    func application(_ application: UIApplication, handleOpen url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        return Auth.auth().canHandle(url)
    }


}

