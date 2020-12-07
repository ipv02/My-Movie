

import Foundation


class Validators {
    
    //MARK: - Textfields Validate
    static func isFilled(email: String?, password: String?, confirmPassword: String?) -> Bool {
        
        guard let email = email,
              let password = password,
              let confirmPassword = confirmPassword,
              email != "",
              password != "",
              confirmPassword != ""
        else {
            return false
        }
        return true
    }
    
    //MARK: - Email & Pass Validate
    static func isFilledProfile(email: String?, password: String?) -> Bool {
        guard let email = email, let password = password, email != "", password != "" else { return false }
        return true
    }
    
    static func isSimpleEmail(_ email: String) -> Bool {
        
        let emailRegEx = "^.+@.+\\..{2,}$"
        return check(text: email, regEx: emailRegEx)
    }
    
    private static func check(text: String, regEx: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", regEx)
        return passwordTest.evaluate(with: text)
    }
}
