import UIKit

class BottomBorderTextField: UITextField {
    
    let validator = TextFieldValidator()
    var textFieldType: FieldType?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureStyle()
        setAttributedPlaceholder()
        addBottomBorder()
    }
    
    func configureStyle(){
        backgroundColor = UIColor.clear
        font = UIFont(name: Fonts.SFCompactDisplayMedium, size: 16)
    }
    
    func setAttributedPlaceholder(){
        if let placeholderText = placeholder
        {
            let myString = placeholderText
            let myAttribute = [ NSAttributedString.Key.font: UIFont(name: Fonts.SFCompactDisplayMedium, size: 16), NSAttributedString.Key.foregroundColor: UIColor.init(named: Colors.battleshipGray) ]
            let myAttrString = NSAttributedString(string: myString, attributes: myAttribute as [NSAttributedString.Key : Any])
            
            attributedPlaceholder = myAttrString
        }
    }
    
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
  
        bottomLine.backgroundColor = UIColor.gray.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
    
    func getFieldType()-> FieldType?{
        return textFieldType
    }
    
    func validateField()-> Bool{
        return validator.validateField(textField: self)
    }
}

