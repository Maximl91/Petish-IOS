import Foundation
import Firebase

class FirebaseManager: NSObject {
 
    private let db = Firestore.firestore()
    
    
    // take out db collection into seperate function
    func createUserWithEmailAndPassword(email: String, password: String, name: String?, completionHandler: @escaping (String?)->Void ){
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (authResult, error) in
            if let err = error{
                let errorString = self.firebaseErrorToString(error: err)
                print(errorString)
                completionHandler(errorString)
            }
            else {
                if let userUid = authResult?.user.uid, let name = name {
                    self.db.collection(Constants.FirestoreUserCollection).addDocument(data: [
                        "user_uid": userUid,
                        "name": name ]){ err in
                        
                            if let err = err {
                                let errorString = self.firebaseErrorToString(error: err)
                                print("Error adding user data: \(errorString)")
                                completionHandler(errorString)
                            }else {
                                completionHandler(nil)
                            }
                        }
                }
           }
        })
    }
    
    func signInWithEmailAndPassword(email: String, password: String, completionHandler: @escaping (String?)->Void ){
        Auth.auth().signIn(withEmail: email, password: password, completion:{ (authResult, error) in
            if let e = error {
                let errorString = self.firebaseErrorToString(error: e)
                print(errorString)
                completionHandler(errorString)

                }else{
                    completionHandler(nil)
                }
        })
    }
    
    func firebaseErrorToString(error: Error)-> String{
        let castedError = error as NSError
        let firebaseError = castedError.userInfo
        let errorString = firebaseError["NSLocalizedDescription"] as! String
        return errorString
    }
    
}
