import Foundation
import FBSDKLoginKit

class SignInViewModel: NSObject{
    
    let fieldPlaceholderArray: [CellData]
    private var userData = UserData()
    private let firebaseManager = FirebaseManager()
    
    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Email", cellType: .textField, cellDataType: .email, validateByType: .email),
            CellData(placeholder: "Password", isSecure: true, cellType: .textField, cellDataType: .password, validateByType: .password)
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
    
    func addUserData(_ data: String,_ type: CellDataType ,_ completion: @escaping ( () -> Void ) ){
        if type == CellDataType.name{
            userData.name = data
        }
        else if type == CellDataType.email{
            userData.email = data
        }
        else if type == CellDataType.password{
            userData.password = data
        }
        completion()
    }
    
    func signInClicked(_ completion: @escaping ( (String?)->Void )){
        firebaseManager.signInWith(email: userData.email, password: userData.password, completionHandler: completion)
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
