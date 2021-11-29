import Foundation

class CreatePetDimensionsViewModel: NSObject{
    private var petData = PetData()
    let fieldPlaceholderArray: [CellData]

    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Neck (INCH)", cellType: CellType.textField, textFieldType: TextFieldType.petDimensions),
            CellData(placeholder: "Chest (INCH)", cellType: CellType.textField, textFieldType: TextFieldType.petDimensions),
            CellData(placeholder: "Back (INCH)", cellType: CellType.textField, textFieldType: TextFieldType.petDimensions)]
    }
}
