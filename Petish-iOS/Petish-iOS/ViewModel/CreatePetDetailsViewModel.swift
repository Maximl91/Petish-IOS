import Foundation

class CreatePetDetailsViewModel: NSObject{
    
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
    
    

}
