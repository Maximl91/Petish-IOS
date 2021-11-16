import Foundation

class SignUpViewModel: NSObject{
    
    private let fieldPlaceholderArray: [TextFieldData]
    
    override init(){
        fieldPlaceholderArray = [
            TextFieldData(placeholder: "Name", type: FieldType.regular),
            TextFieldData(placeholder: "Email", type: FieldType.regular),
            TextFieldData(placeholder: "Password", type: FieldType.secure)
        ]
    }

    func getPlaceholderArray() -> [TextFieldData] {
        return fieldPlaceholderArray
    }
}
