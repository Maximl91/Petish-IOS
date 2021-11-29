import Foundation

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

    func createPetProfile(userId: String, _ completion: @escaping (String?, String?)->Void){
        
        // add image to firebase storage
        if let pet = petData{ // can run a check on the object and set as null values which are empty..
            let firstPet = ["id": "1","name": pet.name, "species": pet.species, "birthday": pet.birthday, "primaryBreed": pet.primaryBreed
                            , "weight": pet.weight, "dimensions": ["neck": petDataDimensions.neck, "chest": petDataDimensions.chest, "back": petDataDimensions.back] ] as [String : Any]
                
        firebaseManager.addDocumentToCollection(collectionName: Constants.Firestore.Collections.dogs, userId: userId, data: ["dogs": [firstPet],

        ], completionHandler: completion)

        }
    }
}
