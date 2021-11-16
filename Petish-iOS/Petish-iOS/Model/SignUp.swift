import Foundation

enum FieldType: String{
    case name = "username"
    case email = "email"
    case password = "password"
}

struct TextFieldData{
    let placeholder: String
    let isSecure: Bool
    let validateByType: FieldType?
    
    init(placeholder: String, isSecure:Bool, validateByType: FieldType? = nil)
    {
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.validateByType = validateByType
    }
}

