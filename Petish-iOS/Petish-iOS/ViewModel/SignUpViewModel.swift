import Foundation

class SignUpViewModel: NSObject{
    
    private let fieldPlaceholderArray: [TextFieldData]
    var arrayOfCells: [TextFieldCell] = [TextFieldCell]()
    
    override init(){
        fieldPlaceholderArray = [
            TextFieldData(placeholder: "Name", isSecure: false, validateByType: FieldType.name),
            TextFieldData(placeholder: "Email", isSecure: false,validateByType: FieldType.email),
            TextFieldData(placeholder: "Password", isSecure: true,validateByType: FieldType.password)
        ]
    }

    func getPlaceholderArray() -> [TextFieldData] {
        return fieldPlaceholderArray
    }
    
    func signUpClicked(isCheckboxMarked: Bool){
        // check for validity of all cell's textfields
        var flag = true
        for itemCell in arrayOfCells {
            flag = flag && itemCell.isValid()
            itemCell.checkValidation() // for each cell display if error is present
        }
        
        if flag && isCheckboxMarked { // run if passed all validity tests
            if let name = arrayOfCells[FieldType.name.rawValue].textField.text,
               let email = arrayOfCells[FieldType.email.rawValue].textField.text,
               let password = arrayOfCells[FieldType.password.rawValue].textField.text {
                
                print("name:\(name), email:\(email), password:\(password)")
            }

        else{
            print("error")
        }
    }
    
}
