import UIKit

protocol SignUpViewControllerDelegate{
    func addValidatedTextData(data: String, type: FieldType)
}

class TextFieldCell: UITableViewCell {
    
    var delegate: SignUpViewControllerDelegate?

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
            if textField.validateField(){
                delegate?.addValidatedTextData(data: textData, type: textType)
            }
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

        textField.textFieldType = data.validateByType
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
