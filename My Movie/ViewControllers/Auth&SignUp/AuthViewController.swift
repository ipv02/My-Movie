
import UIKit
import GoogleSignIn


class AuthViewController: UIViewController {
    
    @IBOutlet var googleButton: UIButton!
    @IBOutlet var emailButton: UIButton!
    @IBOutlet var loginButton: UIButton!
    
    let signUpVC = SignUpViewController()
    let loginVC = LoginViewController()
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonView()
        
        signUpVC.delegate = self
        loginVC.delegate = self
        
        GIDSignIn.sharedInstance()?.delegate = self
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
    
    @IBAction func googleButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
    }
}

//MARK: - Extension
extension AuthViewController: AuthNavigatingDelegateProtocol {
    func toSignUpVC() {
        present(signUpVC, animated: true, completion: nil)
    }

    func toLoginVC() {
        present(loginVC, animated: true, completion: nil)
    }
}

// MARK: - GIDSignInDelegate
extension AuthViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        AuthService.shared.googleLogin(user: user, error: error) { (result) in
            switch result {
            case .success(let user):
                FirestoreService.shared.getUserData(user: user) { (result) in
                    switch result {
                    case .success(_):
                        self.showAlert(with: "Success!", and: "You are logged in") {
                            self.performSegue(withIdentifier: "logIn", sender: nil)
                        }
                    case .failure(_):
                        self.showAlert(with: "Success!", and: "You are registered") {
                            self.performSegue(withIdentifier: "signUp", sender: nil)
                        }
                    }
                }
            case .failure(let error):
                self.showAlert(with: "Error!", and: error.localizedDescription)
            }
        }
    }
}

    
