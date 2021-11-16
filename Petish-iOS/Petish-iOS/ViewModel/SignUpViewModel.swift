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
        var flag = true
        for itemCell in arrayOfCells {
            flag = flag && itemCell.isValid()
        }
        
        if flag && isCheckboxMarked {
            print("ok")
        }
        else{
            print("error")
        }
    }
    
}
