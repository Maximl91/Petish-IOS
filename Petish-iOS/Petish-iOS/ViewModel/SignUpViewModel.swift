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
            if (child.value as? String == ""){
                flag = false
            }
        }
        
        print(flag)
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
    
    func signUpClicked(isCheckboxMarked: Bool,_ completion: @escaping ( () -> Void ) ){
        Auth.auth().createUser(withEmail: userData.email, password: userData.password, completion: { (authResult, error) in
          if let err = error{
              print(err)
          }else {
              if let userUid = authResult?.user.uid {
                  self.db.collection(Constants.FirestoreUserCollection).addDocument(data: [
                    "user_uid": userUid,
                    "name": self.userData.name ]){ err in
                        
                        if let err = err {
                            print("Error adding user data: \(err)")
                        } else {
                            completion()
                        }
                    }
                }
            }
        })
    }
}
