

import Foundation


enum UserError {
    case notFilled
    case cannotUnwrapToUserModel
    case cannotGetUserInfo
}

extension UserError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Fill in all the fields", comment: "")
        case .cannotUnwrapToUserModel:
            return NSLocalizedString("Unable to load User information from Firebase", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Unable to convert UserModel from User", comment: "")
        }
    }
}
