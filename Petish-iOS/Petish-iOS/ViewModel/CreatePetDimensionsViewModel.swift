import Foundation
import UIKit

class CreatePetDimensionsViewModel: NSObject{
    
    private let firebaseManager = FirebaseManager()
    private var petDataDimensions = PetDimensions()
    let fieldPlaceholderArray: [CellData]
    var petData: PetData?
    
    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Neck (INCH)", cellType: .textField, cellDataType: .neck, validateByType: .petDimensions),
            CellData(placeholder: "Chest (INCH)", cellType: .textField, cellDataType: .chest, validateByType: .petDimensions),
            CellData(placeholder: "Back (INCH)", cellType: .textField, cellDataType: .back, validateByType: .petDimensions)]
    }
    
    func addPetData(_ data: String,_ type: CellDataType ,_ completion: @escaping ( () -> Void ) ){
        
        if type == CellDataType.neck{
            petDataDimensions.neck = data
        }
        else if type == CellDataType.chest{
            petDataDimensions.chest = data
        }
        else if type == CellDataType.back{
            petDataDimensions.back = data
        }
        
        completion()
    }
 
    
    func createFirstPetProfile(imageData: UIImage?, userId: String, _ completion: @escaping (String?, String?)->Void){
        
        // check if pet data exists
        guard let pet = petData else {
            completion(nil, "error no pet data!")
            return
        }
        
        let petToCreate = preparePetData(userId, pet)
        // add to database
        firebaseManager.addDocumentToCollection(collectionName: Constants.Firestore.Collections.dogs, data: petToCreate){ (documentId: String, error: String?)-> Void in
            // check if no error occured for document
            guard error == nil else {
                completion(nil, error)
                return
            }
            
            // check if theres an image to upload
            guard let image = imageData else {
                print("no image to upload")
                completion(nil, nil)
                return
            }
            
            print("uploading file...")
            self.firebaseManager.uploadImageToStorage(image: image, path: "images/\(userId)/\(documentId).png"){(error: String?)->Void in
                
                // check if error occured for existing image upload
                guard error == nil else {
                    print(error!)
                    completion(nil, error)
                    return
                }
                
                print("uploading file complete")
                completion(nil,nil)
            }
        }
    }
    
    func preparePetData(_ userId: String,_ pet: PetData)-> [String: Any]{
        return ["userId": userId,"name": pet.name, "species": pet.species, "birthday": pet.birthday, "primaryBreed": pet.primaryBreed
                , "weight": pet.weight, "dimensions": ["neck": petDataDimensions.neck, "chest": petDataDimensions.chest, "back": petDataDimensions.back] ] as [String : Any]
    }
}
