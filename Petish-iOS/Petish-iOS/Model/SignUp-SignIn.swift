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
    
//    mutating func addUserData(_ data: String,_ type: FieldType ,_ completion: @escaping ( () -> Void ) ){
//        switch type {
//        case FieldType.name:
//            name = data
//        case FieldType.email:
//            email = data
//        case FieldType.password:
//            password = data
//        }
//            completion()
//    }
//
//    func isUserDataReady()->Bool{
//        var flag = true
//        let mirror = Mirror(reflecting: userData)
//
//        for child in mirror.children  {
//
//            if (child.value as? String == Constants.invalidUserDataString){
//                flag = false
//            }
//        }
//
//        return flag
//    }
}

