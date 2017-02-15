//
//  ViewController.swift
//  t0039494
//
//  Created by O.E.Wilson on 09/02/2017.
//  Copyright © 2017 O.E.Wilson. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper


class ViewControllerSignin: UIViewController {

    @IBOutlet var EmailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
          }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "GoToFeed" , sender: nil)
        }
    }


    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to authenticate with firebase")
            } else {
                print("Authenticated with firebase")
                if let user = user {
                    self.completeSignIn(id: user.uid)
                }
                
            }
        })
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if let Email = EmailField.text, let Password = PasswordField.text {
            FIRAuth.auth()?.signIn(withEmail: Email, password: Password, completion: { (user, error) in
                if error == nil {
                    print("User Email Authenticated with FIrebase")
                    if let user = user {
                     self.completeSignIn(id: user.uid)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: Email, password: Password, completion: { (user, error) in
                        if error != nil {
                            print("unable to authebticate with Firebase using Email")
                            
                        } else {
                            print("Successfully Authenticated with Firebase")
                            if let user = user {
                                self.completeSignIn(id: user.uid)                            }
                            
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String) {
         let KeychainFinal = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print ("WILSON: Data Saved To Keychain \(KeychainFinal)")
        performSegue(withIdentifier: "GoToFeed" , sender: nil)

        

            }
}

