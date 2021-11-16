import Foundation

protocol TextFieldValidatorDelegate {
    func showErrorMsg(errString: String)
    func hideErrorMsg()
}

class TextFieldValidator{
    
    var delegate: TextFieldValidatorDelegate?
    
    func validateField(textFieldCell: TextFieldCell){
    
        if let type = textFieldCell.getFieldType(), let textField = textFieldCell.textField{
            var flag = false
            
            switch type {
            case FieldType.name:
                flag = validateName(textField)
            case FieldType.email:
                flag = validateEmail(textField)
            case FieldType.password:
                flag = validatePassword(textField)
            }
            
            if flag {
                delegate?.hideErrorMsg()
            }
        }
    }
    
    func validateName(_ field: BottomBorderTextField)-> Bool{
        if(field.text == ""){
            delegate?.showErrorMsg(errString: "Insert a valid name!")
            return false
        }
        
        return true
    }
    
    func validateEmail(_ field: BottomBorderTextField)-> Bool{
        
        var isValidEmail: Bool {
            NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: field.text)}
        
        if(!isValidEmail){
            delegate?.showErrorMsg(errString: "Insert a valid email")
            return false
        }
        
        return true
    }
    
    func validatePassword(_ field: BottomBorderTextField)-> Bool{
        let passLength = field.text?.count

        if(passLength! < 6){
            delegate?.showErrorMsg(errString: "password too short!")
            return false
        }
        
        return true
    }
}
