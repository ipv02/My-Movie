

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {
    

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var plusButton: UIButton! 
    @IBOutlet var fullNameTextfield: UITextField!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var saveButton: UIButton!
    
    
//    private let currentUser: User
//
//    init(currentUser: User) {
//        self.currentUser = currentUser
//        super.init(nibName: nil, bundle: nil)
//
//        if let userName = currentUser.displayName {
//            fullNameTextfield.text = userName
//        }
//        if let photoUrl = currentUser.photoURL {
//            profileImageView.image = .none
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupProfileImage()

    }
    
    private func setupProfileImage() {
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.masksToBounds = false
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height / 2
        profileImageView.clipsToBounds = true
    }

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
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
//        FirestoreService.shared.saveProfileWith(id: currentUser.uid,
//                                                email: currentUser.email!,
//                                                userName: fullNameTextfield.text,
//                                                avatarImage: profileImageView.image,
//                                                sex: segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)) { (result) in
//            switch result {
//            case .success(_):
//                self.showAlert(with: "Success!", and: "Data saved")
//            case .failure(let error):
//                self.showAlert(with: "Error!", and: error.localizedDescription)
//            }
//        }
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        profileImageView.image = image
    }
}
