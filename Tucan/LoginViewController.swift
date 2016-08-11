//
//  Login.swift
//  Tucan
//
//  Created by Philipp Eibl on 8/10/16.
//  Copyright © 2016 Philipp Eibl. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController, GIDSignInUIDelegate {
    
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
        signInButton.colorScheme = .Light
        signInButton.style = .Wide
        getUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getUser() {
        FIRAuth.auth()?.addAuthStateDidChangeListener { auth, user in
            if let user = user {
                // User is signed in.
                let name = user.displayName
                let email = user.email
                let photoUrl = user.photoURL
                let uid = user.uid;  // The user's ID, unique to the Firebase project.
                // Do NOT use this value to authenticate with
                // your backend server, if you have one. Use
                // getTokenWithCompletion:completion: instead.
                print(name, email, photoUrl, uid)
            } else {
                // No user is signed in.
            }
        }
    }
}