//
//  ViewController.swift
//  t0039494
//
//  Created by O.E.Wilson on 09/02/2017.
//  Copyright © 2017 O.E.Wilson. All rights reserved.
//

import UIKit
import Firebase

class ViewControllerSignin: UIViewController {

    @IBOutlet var EmailField: UITextField!
    @IBOutlet var PasswordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to authenticate with firebase")
            } else {
                print("Authenticated with firebase")
            }
        })
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        if let Email = EmailField.text, let Password = PasswordField.text {
            FIRAuth.auth()?.signIn(withEmail: Email, password: Password, completion: { (user, error) in
                if error == nil {
                    print("User Email Authenticated with FIrebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: Email, password: Password, completion: { (user, error) in
                        if error != nil {
                            print("unable to authebticate with Firebase using Email")
                
                        } else {
                            print("Successfully Authenticated with Firebase")
                        }
                    })
                }
        })
    }
}
}
