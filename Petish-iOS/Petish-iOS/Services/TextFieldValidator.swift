import Foundation

protocol TextFieldValidatorDelegate {
    func showErrorMsg(errString: String)
    func hideErrorMsg()
}

class TextFieldValidator{
    
    var delegate: TextFieldValidatorDelegate?
    
    func validateField(textField: BottomBorderTextField)-> Bool{
        var flag = false
        if let type = textField.getFieldType(){
            
            if type == textFieldType.name{
                flag = validateName(textField)
            }
            else if type == textFieldType.email{
                flag = validateEmail(textField)
            }
            else if type == textFieldType.password{
                flag = validatePassword(textField)
            }
            else if type == textFieldType.petDimensions{
                flag = validateDimension(textField)
            }
            
            if flag {
                delegate?.hideErrorMsg()
            }
        }
        return flag
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
            delegate?.showErrorMsg(errString: "Insert a valid email!")
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
    
    func validateDimension(_ field: BottomBorderTextField)-> Bool{
        
        var isValid: Bool {
            NSPredicate(format: "SELF MATCHES %@", "^[1-9][0-9]?$|^100$").evaluate(with: field.text)}
 
        if(!isValid){
            delegate?.showErrorMsg(errString: "invalid value, 1-100 only")
            return false
        }
        
        return true
    }
}
