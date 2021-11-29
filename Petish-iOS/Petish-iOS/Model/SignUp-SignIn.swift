import Foundation

enum TextFieldType: Int{
    case none = 0
    case name
    case email
    case password
    // pet create types
    case petDimensions
    case birthday
    case species
    case breed
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
    let textFieldType: TextFieldType?
    let dataSource: [String?]
    
    init(placeholder: String, isSecure:Bool = false, cellType: CellType, textFieldType: TextFieldType? = nil, dropMenuDataSource: [String?] = [])
    {
        self.placeholder = placeholder
        self.isSecure = isSecure
        self.cellType = cellType
        self.textFieldType = textFieldType
        self.dataSource = dropMenuDataSource
    }
}

struct UserData{
    var name: String? = nil
    var email: String = Constants.invalidUserDataString
    var password: String = Constants.invalidUserDataString
    
    init(){}
    
    init(name: String, email:String, password: String)
    {
        self.name = name
        self.email = email
        self.password = password
    }
}

