import Foundation

class CreatePetDetailsViewModel: NSObject{
    
    private var petData = PetData()
    let fieldPlaceholderArray: [CellData]
    
    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Pet's Name", cellType: CellType.textField, validateByType: textFieldType.name),
            CellData(placeholder: "Species", cellType: CellType.textField),
            CellData(placeholder: "Birthday", cellType: CellType.datePicker),
            CellData(placeholder: "Primary Breed", cellType: CellType.textField),
            CellData(placeholder: "Weight (kg)", cellType: CellType.slider)
        ]
    }
    
    
    
    func getPetData() -> PetData{
        return petData
    }
    
    func addPetData(_ data: String,_ type: textFieldType ,_ completion: @escaping ( () -> Void ) ){

        if type == textFieldType.name{
            petData.name = data
        }
        if type == textFieldType.birthday{
            petData.birthday = data
        }

        completion()
    }
    
    func addWeight(_ data: Int){
        petData.weight = data
    }
    
}
