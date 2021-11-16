import UIKit

class TextFieldCell: UITableViewCell {

    private var validator = TextFieldValidator()
    private var textFieldType: FieldType?
    
    @IBOutlet weak var textField: BottomBorderTextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        validator.delegate = self
        
        textField.returnKeyType = .done
        errorLabel.isHidden = true
    }

    @IBAction func textFieldDidEnd(_ sender: BottomBorderTextField){
    }
    
    @IBAction func textFieldEditEnded(_ sender: Any) {
        checkValidation()
    }
    
    func isValid() -> Bool{
        return errorLabel.isHidden
    }
    
    func checkValidation(){
        validator.validateField(textFieldCell: self)
    }
    
    func getFieldType()-> FieldType?{
        return textFieldType
    }
    
    func initCell(with viewModel: SignUpViewModel, cellIndex: Int){
        // array is read-only
        let placeholderArray = viewModel.getPlaceholderArray()
        textField.placeholder = placeholderArray[cellIndex].placeholder
        
        if placeholderArray[cellIndex].isSecure {
            textField.isSecureTextEntry = true
            // disable autofill from icloud keychain (error on debug)
            textField.textContentType = .oneTimeCode
        }
        
      textFieldType = placeholderArray[cellIndex].validateByType
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
