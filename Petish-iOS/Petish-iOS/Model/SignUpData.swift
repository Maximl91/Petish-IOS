import Foundation

enum FieldType: String{
    case regular = "regular"
    case secure = "secure"
}

struct TextFieldData{
    let placeholder: String
    let type: FieldType
    
    init(placeholder: String, type: FieldType)
    {
        self.placeholder = placeholder
        self.type = type
    }
}

