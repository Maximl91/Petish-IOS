import Foundation

protocol TextFieldValidatorDelegate {
    func showErrorMsg(errString: String)
    func hideErrorMsg()
}

class TextFieldValidator{
    
    var delegate: TextFieldValidatorDelegate?
    
    func validateField(textFieldCell: TextFieldCell){
    
        if let type = textFieldCell.getFieldType(), let textField = textFieldCell.textField{
            switch type {
            case FieldType.name:
                validateName(textField)
            case FieldType.email:
                validateEmail(textField)
            }
        }
    }
    
    func validateName(_ field: BottomBorderTextField){
        if(field.text == ""){
            delegate?.showErrorMsg(errString: "Insert a valid name!")
        }
        else{
            delegate?.hideErrorMsg()
        }
    }
    
    func validateEmail(_ field: BottomBorderTextField){
        
        var isValidEmail: Bool {
            NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: field.text)}
        
        if(!isValidEmail){
            delegate?.showErrorMsg(errString: "Insert a valid email")
        }
        else{
            delegate?.hideErrorMsg()
        }
    }
    
    
}
