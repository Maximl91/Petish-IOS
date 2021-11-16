import UIKit

class TextFieldCell: UITableViewCell {

    private var textFieldValidator = 0
    
    @IBOutlet weak var textField: BottomBorderTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.returnKeyType = .done
    }

    @IBAction func textFieldDidEnd(_ sender: BottomBorderTextField) {
    }
    
    @IBAction func textFieldEditEnded(_ sender: Any) {
        print("ended")
        // call validator
    }
    
    func initCell(with viewModel: SignUpViewModel, cellIndex: Int){
        
        // specific validator
        // textFieldValidator = viewModel.Validator()...
        
        // array is read-only
        let placeholderArray = viewModel.getPlaceholderArray()
        textField.placeholder = placeholderArray[cellIndex].placeholder
        
        if placeholderArray[cellIndex].type == FieldType.secure{
            textField.isSecureTextEntry = true
            // disable autofill from icloud keychain
            textField.textContentType = .oneTimeCode
        }
    }
}
