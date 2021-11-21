import Foundation

class SignInViewModel: NSObject{
    
    let fieldPlaceholderArray: [TextFieldData]
    private var userData = UserData()
    private let firebaseManager = FirebaseManager()
    
    override init(){
        fieldPlaceholderArray = [
            TextFieldData(placeholder: "Email", isSecure: false, validateByType: FieldType.email),
            TextFieldData(placeholder: "Password", isSecure: true, validateByType: FieldType.password)
        ]
    }
    
    func getUserData()-> UserData{
        return userData
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
    
    func signInClicked(_ completion: @escaping ( (String?)->Void )){
        firebaseManager.signInWithEmailAndPassword(email: userData.email, password: userData.password, completionHandler: completion)
    }
}
