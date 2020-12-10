

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var plusButton: UIButton!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var logOutButton: UIButton!
    
    //MARK: - Life cicle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProfileImage()
        setupButtonView()
    }
    
    //MARK: - Private Methods
    private func setupProfileImage() {
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
    }
    
    private func setupButtonView() {
        
        logOutButton.layer.cornerRadius = 7
        logOutButton.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        logOutButton.titleLabel?.textColor = .black
        logOutButton.layer.shadowColor = UIColor.black.cgColor
        logOutButton.layer.shadowRadius = 4
        logOutButton.layer.shadowOpacity = 0.2
        logOutButton.layer.shadowOffset = CGSize(width: 0, height: 4)
    }

    //MARK: - IB Action
    @IBAction func logOutTapped(_ sender: Any) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
}

//MARK: - Extension
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        profileImageView.image = image
    }
}

