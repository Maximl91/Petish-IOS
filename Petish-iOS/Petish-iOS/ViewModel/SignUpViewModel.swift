import Foundation
import Firebase

class SignUpViewModel: NSObject{
    
    private let fieldPlaceholderArray: [TextFieldData]
    var arrayOfCells: [TextFieldCell] = [TextFieldCell]()
    let db = Firestore.firestore()
    
    
    override init(){
        fieldPlaceholderArray = [
            TextFieldData(placeholder: "Name", isSecure: false, validateByType: FieldType.name),
            TextFieldData(placeholder: "Email", isSecure: false,validateByType: FieldType.email),
            TextFieldData(placeholder: "Password", isSecure: true,validateByType: FieldType.password)
        ]
    }

    func getPlaceholderArray() -> [TextFieldData] {
        return fieldPlaceholderArray
    }
    
    func isTextFieldInCellsArrayValid() -> Bool{
        var flag = true
        for itemCell in arrayOfCells {
            flag = flag && itemCell.isValid()
            itemCell.checkValidation() // for each cell display if error is present
        }
        return flag
    }
    
    func signUpClicked(isCheckboxMarked: Bool,_ completion: @escaping ( () -> Void ) ){
        
        if isTextFieldInCellsArrayValid() && isCheckboxMarked{ // run if passed all validity tests
            if let name = arrayOfCells[FieldType.name.rawValue].textField.text,
               let email = arrayOfCells[FieldType.email.rawValue].textField.text,
               let password = arrayOfCells[FieldType.password.rawValue].textField.text {
                
                Auth.auth().createUser(withEmail: email, password: password, completion: { (authResult, error) in
                  if let err = error{
                      print(err)
                  }else {
                      if let userUid = authResult?.user.uid {
                          self.db.collection("users").addDocument(data: [
                            "user_uid": userUid,
                            "name": name]){ err in
                                
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
        }else{
            print("error validation failed!")
        }
    }
}
