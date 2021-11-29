import Foundation

class CreatePetDimensionsViewModel: NSObject{
    private var petData = PetData()
    let fieldPlaceholderArray: [CellData]
    
    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Neck (INCH)", cellType: .textField, cellDataType: .neck, validateByType: .petDimensions),
            CellData(placeholder: "Chest (INCH)", cellType: .textField, cellDataType: .chest, validateByType: .petDimensions),
            CellData(placeholder: "Back (INCH)", cellType: .textField, cellDataType: .back, validateByType: .petDimensions)]
    }
}
