import Foundation

class CreatePetDetailsViewModel: NSObject{
    
    private var petData = PetData()
    let fieldPlaceholderArray: [CellData]
    
    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Pet's Name", cellType: CellType.textField, textFieldType: TextFieldType.name),
            CellData(placeholder: "Species", cellType: CellType.dropMenu, dropMenuDataSource: ["Dog"]),
            CellData(placeholder: "Birthday", cellType: CellType.datePicker),
            CellData(placeholder: "Primary Breed", cellType: CellType.dropMenu, dropMenuDataSource: ["Terrier Dog", "German Shepard"]),
            CellData(placeholder: "Weight (kg)", cellType: CellType.slider)
        ]
    }
    
    func getPetData() -> PetData{
        return petData
    }
    
    func addPetData(_ data: String,_ type: TextFieldType ,_ completion: @escaping ( () -> Void ) ){

        if type == TextFieldType.name{
            petData.name = data
        }
        if type == TextFieldType.birthday{
            petData.birthday = data
        }

        completion()
    }
    
    func addWeight(_ data: Int){
        petData.weight = data
    }
    
}
