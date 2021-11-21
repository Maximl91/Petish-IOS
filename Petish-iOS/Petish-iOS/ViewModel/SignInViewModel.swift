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
    
    func firebaseErrorToString(error: Error)-> String{
        let castedError = error as NSError
        let firebaseError = castedError.userInfo
        let errorString = firebaseError["NSLocalizedDescription"] as! String
        return errorString
    }
    
    func signInClicked(_ completion: @escaping ( (String?)->Void )){
        Auth.auth().signIn(withEmail: userData.email, password: userData.password, completion:{ (authResult, error) in
            if let e = error {
                let errorString = self.firebaseErrorToString(error: e)
                print(errorString)
                completion(errorString)
            
                }else{
                    completion(nil)
                }
        })
    }
}
