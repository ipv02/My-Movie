

import Firebase
import FirebaseFirestore

class FirestoreService {
    
    static let shared = FirestoreService()
    
    let db = Firestore.firestore()
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    var currentUser: UserModel!
    
    func getUserData(user: User, completion: @escaping (Result<UserModel, Error>) -> Void) {
        let docRef = usersRef.document(user.uid)
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                guard let userModel = UserModel(document: document) else {
                    completion(.failure(UserError.cannotUnwrapToUserModel))
                    return
                }
                self.currentUser = userModel
                completion(.success(userModel))
            } else {
                completion(.failure(UserError.cannotGetUserInfo))
            }
        }
    }
    
    func saveProfileWith(id: String,
                         email: String,
                         userName: String?,
                         avatarImage: UIImage?,
                         sex: String?,
                         completion: @escaping (Result<UserModel, Error>) -> Void) {
        guard Validators.isFilledProfile(userName: userName, sex: sex) else {
            completion(.failure(UserError.notFilled))
            return
        }

        var userModel = UserModel(email: email,
                                  id: id,
                                  userName: userName!,
                                  sex: sex!,
                                  avatarStringUrl: "not exist")
        StorageService.shared.upload(photo: avatarImage!) { (result) in
            switch result {
            case .success(let url):
                userModel.avatarStringUrl = url.absoluteString
                self.usersRef.document(userModel.id).setData(userModel.represintation) { (error) in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(userModel))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}




