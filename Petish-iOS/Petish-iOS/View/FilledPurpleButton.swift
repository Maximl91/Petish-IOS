import UIKit

class FilledPurpleButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        
        configureStyle()
        setAttributedLabel()
    }
    
    func configureStyle(){
        backgroundColor = UIColor(named: Colors.violetBlue)
        layer.cornerRadius = 8
    }
    
    func setAttributedLabel(){
        if let title = titleLabel?.text {
            let myString = title
            let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Fonts.SFProTextMedium, size: 16) ]
            let myAttrString = NSAttributedString(string: myString, attributes: myAttribute as [NSAttributedString.Key : Any])
            
            setAttributedTitle(myAttrString , for: .normal)
        }
    }
    
}
