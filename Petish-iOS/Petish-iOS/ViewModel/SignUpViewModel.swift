import Foundation

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
    
    func signUpClicked(isCheckboxMarked: Bool,_ completion: @escaping ( (String?,String?) -> Void ) ){
        
        firebaseManager.createUserWith(email: userData.email, password: userData.password){ (userId: String?, error: String?)-> Void in
            guard error != nil, let userId = userId, let name = self.userData.name else {
                // login failed
                completion(nil, error)
                return
            }
            // login successful
            self.firebaseManager.addDocumentToCollection(collectionName: Constants.FirestoreUserCollection, data: [
                "user_uid": userId,
                "name": name], completionHandler: completion)
        }
    }
}
