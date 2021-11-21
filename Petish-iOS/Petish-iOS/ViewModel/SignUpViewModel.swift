import Foundation
import Firebase

class SignUpViewModel: NSObject{
    
    private let db = Firestore.firestore()
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
    
    func firebaseErrorToString(error: Error)-> String{
        let castedError = error as NSError
        let firebaseError = castedError.userInfo
        let errorString = firebaseError["NSLocalizedDescription"] as! String 
        return errorString
    }
    
    func signUpClicked(isCheckboxMarked: Bool,_ completion: @escaping ( (String?) -> Void ) ){
        Auth.auth().createUser(withEmail: userData.email, password: userData.password, completion: { (authResult, error) in
            if let err = error{
                let errorString = self.firebaseErrorToString(error: err)
                print(errorString)
                completion(errorString)
            }else {
                if let userUid = authResult?.user.uid, let name = self.userData.name {
                    self.db.collection(Constants.FirestoreUserCollection).addDocument(data: [
                        "user_uid": userUid,
                        "name": name ]){ err in
                        
                            if let err = err {
                                let errorString = self.firebaseErrorToString(error: err)
                                print("Error adding user data: \(errorString)")
                                completion(errorString)
                            }else {
                                completion(nil)
                            }
                        }
                }
           }
        })
    }
}
