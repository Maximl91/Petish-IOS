import Foundation

class CreatePetDimensionsViewModel: NSObject{
    
    private let firebaseManager = FirebaseManager()
    let fieldPlaceholderArray: [CellData]
    var petData: PetData?
    
    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Neck (INCH)", cellType: .textField, cellDataType: .neck, validateByType: .petDimensions),
            CellData(placeholder: "Chest (INCH)", cellType: .textField, cellDataType: .chest, validateByType: .petDimensions),
            CellData(placeholder: "Back (INCH)", cellType: .textField, cellDataType: .back, validateByType: .petDimensions)]
    }
    
    func createPetProfile(_ completion: @escaping (String?, String?)->Void){
        // id for dog and user?
        // add to collection
        // add image to firebase storage
        let userId = "1"
        firebaseManager.addDocumentToCollection(collectionName: Constants.Firestore.Collections.dogs, userId: userId, data: ["": ""
        
        ], completionHandler: completion)
    }
}
