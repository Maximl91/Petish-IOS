import UIKit

class TransparentPurpleButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
        configureStyle()
        setAttributedLabel()
    }
    
    func configureStyle(){
        backgroundColor = UIColor.clear
    }
    
    func setAttributedLabel(){
        if let title = titleLabel?.text {
            let myString = title
            let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: Colors.violetBlue), NSAttributedString.Key.font: UIFont(name: Fonts.SFProTextMedium, size: 14) ]
            let myAttrString = NSAttributedString(string: myString, attributes: myAttribute as [NSAttributedString.Key : Any])
            
            setAttributedTitle(myAttrString , for: .normal)
        }
    }
}
