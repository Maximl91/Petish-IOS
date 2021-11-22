import Foundation
import FBSDKLoginKit

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
    
    func signInFacebookClicked(listener: UIViewController,_ completion: @escaping ( (String?)->Void )){
        
        let loginManager = LoginManager()
        
        loginManager.logIn(permissions: ["public_profile", "email"], from: listener) { (result, error) in
            // Check for error
            guard error == nil else {
                // Error occurred
                print(error!.localizedDescription)
                completion(error!.localizedDescription)
                return
            }
            
            // Check for cancel
            guard let result = result, !result.isCancelled else {
                print("User cancelled login")
                completion("User cancelled login")
                return
            }
            
            // Successfully logged in, add user to database
            Profile.loadCurrentProfile { (profile, error) in
                
                completion(nil)
            }
        }
    }
}
