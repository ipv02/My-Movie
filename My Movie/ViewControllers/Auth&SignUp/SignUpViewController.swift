//
//  SignUpViewController.swift
//  My Movie
//
//  Created by Elena Igumenova on 14.11.2020.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var confirmPasswordTextfield: UITextField!
    
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        
        setupTextfieldView()
        setupButtonView()
    }
    
    private func setupTextfieldView() {
        
        
        
    }
    
    private func setupButtonView() {
        
        signUpButton.layer.cornerRadius = 5
        signUpButton.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        signUpButton.titleLabel?.textColor = .black
        signUpButton.layer.shadowColor = UIColor.black.cgColor
        signUpButton.layer.shadowRadius = 4
        signUpButton.layer.shadowOpacity = 0.2
        signUpButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        logInButton.layer.cornerRadius = 5
        logInButton.backgroundColor = .white
        logInButton.titleLabel?.textColor = .black
        logInButton.layer.shadowColor = UIColor.black.cgColor
        logInButton.layer.shadowRadius = 4
        logInButton.layer.shadowOpacity = 0.2
        logInButton.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
