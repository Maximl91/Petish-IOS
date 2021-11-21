import Foundation
import Firebase

class SignInViewModel: NSObject{
    
    let fieldPlaceholderArray: [TextFieldData]
    private var userData = UserData()
    
    override init(){
        fieldPlaceholderArray = [
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
    
    func signInClicked(_ completion: @escaping ( (String?)->Void )){
        Auth.auth().signIn(withEmail: userData.email, password: userData.password, completion:{ (authResult, error) in
//            if let e = error {
//                print(e)
//            }else{
//                completion()
//            }
            
            if let e = error {
                        let castedError = e as NSError
                        let firebaseError = castedError.userInfo
                        if let errorString = firebaseError["NSLocalizedDescription"] as! String? {
                            print(errorString)
                            completion(errorString)
                            }
                        }else{
                            completion(nil)
                        }
        })
    }
}
