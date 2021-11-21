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

struct UserData{
    var name: String? = nil
    var email: String = Constants.invalidUserDataString
    var password: String = Constants.invalidUserDataString
    
    init(){}
    
    init(name: String, email:String, password: String)
    {
        self.name = name
        self.email = email
        self.password = password
    }
}

