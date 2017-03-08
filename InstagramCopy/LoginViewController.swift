//
//  LoginViewController.swift
//  InstagramCopy
//
//  Created by Deep S Randhawa on 3/7/17.
//  Copyright © 2017 Deep S Randhawa. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    // OUTLET
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    // GLOBAL VARS
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignInButtonClicked(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if (user != nil) {
                print("You're logged in.")
                self.performSegue(withIdentifier: "LoginVCToMainVCSegue", sender: nil)
            }
        }
    }

    @IBAction func onSignUpButtonClicked(_ sender: Any) {
        let user = PFUser()
        
        user.password = passwordField.text
        user.username = usernameField.text
        
        user.signUpInBackground { (success: Bool, error: Error?) in
            if (success) {
                print("Created a new user.")
                self.performSegue(withIdentifier: "LoginVCToMainVCSegue", sender: nil)
            } else {
                print(error?.localizedDescription)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
