import Foundation

enum CellDataType: Int{
    case none = 0
    case name
    case email
    case password
    // pet create types
    case birthday
    case species
    case breed
    case weight
    // pet dimensions
    case neck
    case chest
    case back
}

enum CellType: Int{
    case textField = 0
    case slider
    case dropMenu
    case datePicker
}

struct CellData{
    let placeholder: String
    let isSecure: Bool
    let cellType: CellType
    let cellDataType: CellDataType?
    let validateByType: TextFieldValidationType?
    let dataSource: [String?]
    
    init(placeholder: String, isSecure:Bool = false, cellType: CellType, cellDataType: CellDataType? = nil, validateByType: TextFieldValidationType? = nil, dropMenuDataSource: [String?] = [])
    {
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.cellType = cellType
        self.cellDataType = cellDataType
        self.validateByType = validateByType
        self.dataSource = dropMenuDataSource
    }
}
