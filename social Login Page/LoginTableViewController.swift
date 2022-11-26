//
//  LoginTableViewController.swift
//  social Login Page
//
//  Created by Admin on 24/11/22.
//

import UIKit

class LoginTableViewController: UITableViewController {
    
    
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordLBL: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text{
            if email == "" {
                openAlert(title: "Alert", message: "Please Add Email id", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                    print("empty text field")
                }])
            }else if password == "" {
                openAlert(title: "Alert", message: "Please Insert password", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                    print("empty text field")
                }])
            }
            if !email.validateEmailId(){
                openAlert(title: "Alert", message: "Invalid Email id", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                    print("invalid email")
                }])
                
            }else if !password.validatePassword(){
                openAlert(title: "Alert", message: "Invalid password", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                    print("invalid password")
                }])
                
            }else{
                // navigation -> home screen
                let homeVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                self.navigationController?.pushViewController(homeVc, animated: true)
                
            }
                
            }else{
                // when textField is nill
                openAlert(title: "Alert", message: "Please Add details", alertStyle: .alert, actionTitles: ["OK"], actionStyles: [.default], actions: [{_ in
                    print("empty text field")
                }])
                
            }
            
        }
    
        
        @IBAction func forgetPasswordButton(_ sender: UIButton) {
        }
        
        @IBAction func signupButton(_ sender: UIButton) {
            let signupVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpTableViewController") as! SignUpTableViewController
            self.navigationController?.pushViewController(signupVC, animated: true)
        }
        
        
        @IBAction func googleLogin(_ sender: UIButton) {
        }
        
        
    }
    
    extension String{
        
        func validateEmailId() -> Bool {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
            return applyPredicateOnRegex(regexStr:emailRegEx )
        }
        
        func validatePassword(min:Int = 8, max:Int = 8) -> Bool {
            // Minimum 8 character and at least 1 Alphabhate and 1 number
            var passRegEx = ""
            if min >= max  {
                passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(min),}$"
            }
            else{
                passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{\(min),\(max)}$"
            }
            return applyPredicateOnRegex(regexStr: passRegEx)
        }
        
        
        
        func applyPredicateOnRegex(regexStr:String ) -> Bool {
            let trimmedString = self.trimmingCharacters(in: .whitespaces)
            let validateOtherString = NSPredicate(format: "SELF MATCHES %@", regexStr)
            let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
            return isValidateOtherString
        }
    }

