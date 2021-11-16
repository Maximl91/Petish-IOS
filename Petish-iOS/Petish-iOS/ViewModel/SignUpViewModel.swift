import Foundation

class SignUpViewModel: NSObject{
    
    
    private let fieldPlaceholderArray: [TextFieldData]
    
    override init(){
        fieldPlaceholderArray = [
            TextFieldData(placeholder: "Name", isSecure: false, validateByType: FieldType.name),
            TextFieldData(placeholder: "Email", isSecure: false,validateByType: FieldType.email),
            TextFieldData(placeholder: "Password", isSecure: true)
        ]
    }

    func getPlaceholderArray() -> [TextFieldData] {
        return fieldPlaceholderArray
    }
}
