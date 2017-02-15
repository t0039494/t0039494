//
//  FeedVC.swift
//  t0039494
//
//  Created by O.E.Wilson on 13/02/2017.
//  Copyright © 2017 O.E.Wilson. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    @IBAction func SignInTapped(_ sender: Any) {
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "GoToSignIn", sender: nil)
    }
   
}
