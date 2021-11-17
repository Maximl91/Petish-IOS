import Foundation
import Firebase

class SignUpViewModel: NSObject{
    
    let db = Firestore.firestore()
    let fieldPlaceholderArray: [TextFieldData]
    var userData = UserData()
    
    
    override init(){
        fieldPlaceholderArray = [
            TextFieldData(placeholder: "Name", isSecure: false, validateByType: FieldType.name),
            TextFieldData(placeholder: "Email", isSecure: false,validateByType: FieldType.email),
            TextFieldData(placeholder: "Password", isSecure: true,validateByType: FieldType.password)
        ]
    }
    
    func isUserDataReady()->Bool{ // change this
        var flag = true
        if(userData.name == "" || userData.password == "" || userData.name == ""){
            flag = false
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
