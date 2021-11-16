import Foundation

enum FieldType: Int{
    case name = 0
    case email
    case password
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

