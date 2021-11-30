import Foundation
import Firebase
import UIKit
import FirebaseStorage

class FirebaseManager: NSObject {
    
    private let db = Firestore.firestore()
    private let storage = Storage.storage().reference()
    
    func createUserWith(email: String, password: String, completionHandler: @escaping (String?,String?)->Void ){
        // returns userId on successful completion
        Auth.auth().createUser(withEmail: email, password: password, completion: { (authResult, error) in
            if let err = error{
                let errorString = self.firebaseErrorToString(error: err)
                print(errorString)
                completionHandler(nil, errorString)
            }
            else {
                if let userId = authResult?.user.uid {
                    completionHandler(userId, nil)
                }else{
                    completionHandler(nil,"error parsing userUid from response")
                }
            }
        })
    }
    
    
    func addDocumentToCollection(collectionName: String, userId: String, data: [String:Any], completionHandler: @escaping (String?,String?)->Void ){
        
        db.collection(collectionName).document(userId).setData(data){ err in
            if let err = err {
                let errorString = self.firebaseErrorToString(error: err)
                print("Error adding data: \(errorString)")
                completionHandler(userId, errorString)
            }else {
                completionHandler(userId ,nil)
            }
        }
    }
    
    func signInWith(email: String, password: String, completionHandler: @escaping (String?)->Void ){
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
    
    func uploadImageToStorage(image: UIImage, path: String, completionHandler: @escaping (String?)->Void ){
        if let imageData = image.pngData(){
            storage.child(path).putData(imageData, metadata: nil){ (result, error) -> Void in
                if let e = error {
                    let errorString = self.firebaseErrorToString(error: e)
                    print(errorString)
                    completionHandler(errorString)
                }else{
                    completionHandler(nil)
                }
            }
        }else{
            completionHandler("No image data to upload")
        }
    }
        
        func firebaseErrorToString(error: Error)-> String{
            let castedError = error as NSError
            let firebaseError = castedError.userInfo
            let errorString = firebaseError["NSLocalizedDescription"] as! String
            return errorString
        }
        
    }
