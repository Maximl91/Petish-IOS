import Foundation

class CreatePetDetailsViewModel: NSObject{
    
    private var petData = PetData()
    let fieldPlaceholderArray: [CellData]
    
    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Pet's Name", isSecure: false, cellType: CellType.textField, validateByType: textFieldType.name),
            CellData(placeholder: "Species", isSecure: false, cellType: CellType.textField),
            CellData(placeholder: "Birthday", isSecure: false, cellType: CellType.textField),
            CellData(placeholder: "Primary Breed", isSecure: false, cellType: CellType.textField),
            CellData(placeholder: "Weight (kg)", isSecure: false, cellType: CellType.slider)
        ]
    }
    
    func getPetData() -> PetData{
        return petData
    }
    
    func addPetData(_ data: String,_ type: textFieldType ,_ completion: @escaping ( () -> Void ) ){

        if type == textFieldType.name{
            petData.name = data
        }
        
        completion()
    }
    
    func addWeight(_ data: Int){
        petData.weight = data
    }
    
}
