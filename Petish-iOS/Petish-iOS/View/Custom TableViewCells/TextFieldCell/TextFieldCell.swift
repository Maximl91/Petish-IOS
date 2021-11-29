import UIKit

protocol TextFieldCellDelegate{
    func textFieldStateChanged(data: String, type: TextFieldType, isValid: Bool)
}

class TextFieldCell: UITableViewCell {
    
    var delegate: TextFieldCellDelegate?
    
    @IBOutlet weak var textField: BottomBorderTextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.validator.delegate = self
        textField.returnKeyType = .done
        errorLabel.isHidden = true
        textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)),
                            for: .editingChanged)
    }
    
    @IBAction func textFieldDidEnd(_ sender: BottomBorderTextField){
    }
    
    @objc func textFieldDidChange(_ textField2: UITextField) {
        if let textData = textField.text, let textType = textField.getFieldType(){
            let result = textField.validateField()
            delegate?.textFieldStateChanged(data: textData, type: textType, isValid: result)
        }
    }
    
    func isValid() -> Bool{
        return errorLabel.isHidden
    }
    
    func initCell(data: CellData){
        textField.placeholder = data.placeholder
        
        if data.isSecure {
            textField.isSecureTextEntry = true
            // disable autofill from icloud keychain (error on debug)
            textField.textContentType = .oneTimeCode
        }
        
        textField.setFieldType(type: data.textFieldType)
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
