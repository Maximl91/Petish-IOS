import UIKit

protocol UIViewControllerDelegate{
    func textFieldStateChanged(data: String, type: FieldType, isValid: Bool)
}

class TextFieldCell: UITableViewCell {
    
    var delegate: UIViewControllerDelegate?

    @IBOutlet weak var textField: BottomBorderTextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.validator.delegate = self
        textField.returnKeyType = .done
        errorLabel.isHidden = true
    }

    @IBAction func textFieldDidEnd(_ sender: BottomBorderTextField){
    }
    
    @IBAction func textFieldEditEnded(_ sender: Any) {
        if let textData = textField.text, let textType = textField.getFieldType(){
            let result = textField.validateField()
            delegate?.textFieldStateChanged(data: textData, type: textType, isValid: result)
        }
    }
    
    func isValid() -> Bool{
        return errorLabel.isHidden
    }
    
    func initCell(data: TextFieldData){
        textField.placeholder = data.placeholder
        
        if data.isSecure {
            textField.isSecureTextEntry = true
            // disable autofill from icloud keychain (error on debug)
            textField.textContentType = .oneTimeCode
        }

        textField.setFieldType(type: data.validateByType)
    }
}

extension TextFieldCell: TextFieldValidatorDelegate {
    func showErrorMsg(errString: String) {
        errorLabel.text = errString
        errorLabel.isHidden = false
    }
    
    func hideErrorMsg() {
        errorLabel.isHidden = true
    }
}
