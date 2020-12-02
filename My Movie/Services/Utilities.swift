

import UIKit


class Utilities {
    
    static func styleTextfield(_ textfield: UITextField) {
        
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0,
                                  y: textfield.frame.height - 2,
                                  width: textfield.frame.width,
                                  height: 2)
        
        bottomLine.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
    }
    
    static func isPasswordValid(_ password: String) -> Bool {
        
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
        return passwordTest.evaluate(with: password)
    }
}
