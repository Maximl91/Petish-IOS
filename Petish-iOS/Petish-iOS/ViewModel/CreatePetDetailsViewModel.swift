import Foundation

class CreatePetDetailsViewModel: NSObject{
    
    private var petData = PetData()
    let fieldPlaceholderArray: [CellData]
    
    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Pet's Name", cellType: .textField, cellDataType: .name, validateByType: .name),
            CellData(placeholder: "Species", cellType: .dropMenu, cellDataType: .species, dropMenuDataSource: ["Dog"]),
            CellData(placeholder: "Birthday", cellType: .datePicker, cellDataType: .birthday),
            CellData(placeholder: "Primary Breed", cellType: .dropMenu, cellDataType: .breed ,dropMenuDataSource: ["Terrier Dog", "German Shepard"]),
            CellData(placeholder: "Weight (kg)", cellType: .slider, cellDataType: .weight)
        ]
    }
    
    func getPetData() -> PetData{
        return petData
    }
    
    func isReady() -> Bool{
        return petData.name != Constants.emptyString
    }
    
    func addPetData(_ data: String,_ type: CellDataType ,_ completion: @escaping ( () -> Void ) ){
        
        if type == CellDataType.name{
            petData.name = data
        }
        else if type == CellDataType.species{
            petData.species = data
        }
        else if type == CellDataType.birthday{
            petData.birthday = data
        }
        else if type == CellDataType.breed{
            petData.primaryBreed = data
        }
        else if type == CellDataType.weight{
            petData.weight = data
        }
        
        completion()
    }
}
