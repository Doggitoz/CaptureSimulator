//
//  SignIn.swift
//  CaptureSimulator
//
//  Created by Coleton Wheeler on 4/30/19.
//  Copyright © 2019 Front Row. All rights reserved.
//

import UIKit
import GoogleSignIn

class SignIn: GIDSignInButton {

    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!)
    {
        if error == nil {
            //Anything to do here
        } else {
            print("\(error.localizedDescription)")
        }
    }

}
