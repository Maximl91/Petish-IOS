import Foundation

class CreatePetDimensionsViewModel: NSObject{
    private var petData = PetData()
    let fieldPlaceholderArray: [CellData]

    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Neck (INCH)", isSecure: false, cellType: CellType.textField, validateByType: textFieldType.petDimensions),
            CellData(placeholder: "Chest (INCH)", isSecure: false, cellType: CellType.textField, validateByType: textFieldType.petDimensions),
            CellData(placeholder: "Back (INCH)", isSecure: false, cellType: CellType.textField, validateByType: textFieldType.petDimensions)]
    }
}
