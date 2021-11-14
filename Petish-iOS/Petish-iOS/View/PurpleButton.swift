import UIKit

class PurpleButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
        backgroundColor = UIColor(named: "violetBlue")
        layer.cornerRadius = 8
        
        if let title = titleLabel?.text {
            let myString = title
            let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "SFProText-Medium", size: 16) ]
            let myAttrString = NSAttributedString(string: myString, attributes: myAttribute as [NSAttributedString.Key : Any])
            
            setAttributedTitle(myAttrString , for: .normal)
        }
    }
}
