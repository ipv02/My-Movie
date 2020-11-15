
import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet var googleButton: UIButton!
    @IBOutlet var emailButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        setupButtonView()
        
    }
    //MARK: Setup Buttons View
    private func setupButtonView() {
        
        googleButton.layer.cornerRadius = 5
        googleButton.backgroundColor = .white
        googleButton.titleLabel?.textColor = .black
        googleButton.layer.shadowColor = UIColor.black.cgColor
        googleButton.layer.shadowRadius = 4
        googleButton.layer.shadowOpacity = 0.2
        googleButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        googleButton.customizeGoogleButton()
        
        emailButton.layer.cornerRadius = 5
        emailButton.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        emailButton.titleLabel?.textColor = .black
        emailButton.layer.shadowColor = UIColor.black.cgColor
        emailButton.layer.shadowRadius = 4
        emailButton.layer.shadowOpacity = 0.2
        emailButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        loginButton.layer.cornerRadius = 5
        loginButton.backgroundColor = .white
        loginButton.titleLabel?.textColor = .black
        loginButton.layer.shadowColor = UIColor.black.cgColor
        loginButton.layer.shadowRadius = 4
        loginButton.layer.shadowOpacity = 0.2
        loginButton.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    //MARK: IB Action
    @IBAction func emailButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "signUp", sender: nil)
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
}

