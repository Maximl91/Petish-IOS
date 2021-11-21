import Foundation
import Firebase

class SignUpViewModel: NSObject{
    
    private let db = Firestore.firestore()
    private var userData = UserData()
    let fieldPlaceholderArray: [TextFieldData]
    private let firebaseManager = FirebaseManager()
    
    override init(){
        fieldPlaceholderArray = [
            TextFieldData(placeholder: "Name", isSecure: false, validateByType: FieldType.name),
            TextFieldData(placeholder: "Email", isSecure: false, validateByType: FieldType.email),
            TextFieldData(placeholder: "Password", isSecure: true, validateByType: FieldType.password)
        ]
    }
    
    func isUserDataReady()->Bool{
        var flag = true
        let mirror = Mirror(reflecting: userData)
        
        for child in mirror.children  {
       
            if (child.value as? String == Constants.invalidUserDataString){
                flag = false
            }
        }
        
        return flag
    }
    
    func addUserData(_ data: String,_ type: FieldType ,_ completion: @escaping ( () -> Void ) ){
        switch type {
        case FieldType.name:
            userData.name = data
        case FieldType.email:
            userData.email = data
        case FieldType.password:
            userData.password = data
        }
            completion()
    }
    
    func signUpClicked(isCheckboxMarked: Bool,_ completion: @escaping ( (String?) -> Void ) ){
        firebaseManager.createUserWithEmailAndPassword(email: userData.email, password: userData.password, name: userData.name, completionHandler: completion)
    }
}
