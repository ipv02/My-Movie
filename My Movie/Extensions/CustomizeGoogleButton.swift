
import UIKit

extension UIButton {
    
    func customizeGoogleButton() {
        
        let googleLogo = UIImageView(image: #imageLiteral(resourceName: "googleLogo"))
        googleLogo.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(googleLogo)
        googleLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        googleLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
