import Foundation

class CreatePetDimensionsViewModel: NSObject{
    private var petData = PetData()
    let fieldPlaceholderArray: [CellData]

    override init(){
        fieldPlaceholderArray = [
            CellData(placeholder: "Neck (INCH)", cellType: .textField, cellDataType: .petDimensions),
            CellData(placeholder: "Chest (INCH)", cellType: .textField, cellDataType: .petDimensions),
            CellData(placeholder: "Back (INCH)", cellType: .textField, cellDataType: .petDimensions)]
    }
}
