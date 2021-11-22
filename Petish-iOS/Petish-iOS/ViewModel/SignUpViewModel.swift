import Foundation
import FBSDKLoginKit

class SignUpViewModel: NSObject{
    
    private let firebaseManager = FirebaseManager()
    private var userData = UserData()
    let fieldPlaceholderArray: [TextFieldData]
    
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
    
    func signUpClicked(_ completion: @escaping ( (String?,String?) -> Void ) ){
        firebaseManager.createUserWith(email: userData.email, password: userData.password){ (userId: String?, error: String?)-> Void in
            
            guard error == nil, let userId = userId, let name = self.userData.name else {
                // login failed
                print(error!)
                completion(nil, error)
                return
            }
            
            // login successful
            self.firebaseManager.addDocumentToCollection(collectionName: Constants.FirestoreUserCollection, userId: userId, data: [
                "user_uid": userId,
                "name": name], completionHandler: completion)
        }
    }
    
    func signUpWithFacebookClicked(listener: UIViewController, _ completion: @escaping ( (String?,String?) -> Void ) ){
        
        let loginManager = LoginManager()
        
        loginManager.logIn(permissions: ["public_profile", "email"], from: listener) { (result, error) in
            // Check for error
            guard error == nil else {
                // Error occurred
                print(error!.localizedDescription)
                completion(nil,error!.localizedDescription)
                return
            }
            
            // Check for cancel
            guard let result = result, !result.isCancelled else {
                print("User cancelled login")
                completion(nil,"User cancelled login")
                return
            }
            
            // Successfully logged in, add user to database
            Profile.loadCurrentProfile { (profile, error) in
                if let name = Profile.current?.name, let userId = AccessToken.current?.userID {
                    self.firebaseManager.addDocumentToCollection(collectionName: Constants.FirestoreUserCollection, userId: userId, data: [
                        "user_uid": userId,
                        "name": name], completionHandler: completion)
                }
            }
        }
    }
}
