
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var googleButton: UIButton!
    
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        setupButtonView()
    }
    
    private func setupButtonView() {
        
        googleButton.layer.cornerRadius = 5
        googleButton.backgroundColor = .white
        googleButton.titleLabel?.textColor = .black
        googleButton.layer.shadowColor = UIColor.black.cgColor
        googleButton.layer.shadowRadius = 4
        googleButton.layer.shadowOpacity = 0.2
        googleButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        googleButton.customizeGoogleButton()
        
        loginButton.layer.cornerRadius = 5
        loginButton.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        loginButton.titleLabel?.textColor = .black
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowRadius = 4
        loginButton.layer.shadowOpacity = 0.2
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        signUpButton.layer.cornerRadius = 5
        signUpButton.backgroundColor = .white
        signUpButton.titleLabel?.textColor = .black
        signUpButton.layer.shadowColor = UIColor.black.cgColor
        signUpButton.layer.shadowRadius = 4
        signUpButton.layer.shadowOpacity = 0.2
        signUpButton.layer.shadowOffset = CGSize(width: 0, height: 4)
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
