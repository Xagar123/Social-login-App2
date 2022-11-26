//
//  SignUpTableViewController.swift
//  social Login Page
//
//  Created by Admin on 24/11/22.
//

import UIKit

class SignUpTableViewController: UITableViewController {

    
    @IBOutlet weak var imagelbl: UIImageView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingUpScreen()
        
    }
    
    func settingUpScreen() {
        Utilities.styleTextField(userNameField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleTextField(confirmPasswordField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    @IBAction func signUpButtonTapped(_ sender: UIButton) {
    }
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginTableViewController") as! LoginTableViewController
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
