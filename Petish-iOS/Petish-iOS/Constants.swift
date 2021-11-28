import Foundation

struct Constants{
    // HeaderView
    static let headerViewNibName = "HeaderUIView"
    // CollectionViewCell
    static let photoCellNibName = "PhotoCell"
    static let photoCellReuseId = "PhotoCellReuseId"
    // Checkbox
    static let checkboxNibName = "Checkbox"
    static let checkboxOn = true
    static let checkboxOff = false
    // TableViewCell
    static let textFieldCellNibName = "TextFieldCell"
    static let textFieldCellReuseId = "TextfieldCellReuseId"
    static let sliderCellNibName = "SliderCell"
    static let sliderCellReuseId = "SliderCellReuseId"
    static let dropMenuCellNibName = "DropMenuCell"
    static let dropMenuCellReuseId = "DropMenuCellReuseId"
    static let datePickerCellNibName = "DatePickerCell"
    static let datePickerCellReuseId = "DatePickerCellReuseId"
    // Firestore
    static let FirestoreUserCollection = "users"
    static let FirestoreDogsCollection = "dogs"
    //
    static let invalidUserDataString = ""
}


struct Colors{
    static let battleshipGray = "battleshipGray"
    static let violetBlue = "violetBlue"
    static let pinkishGray = "pinkishGray"
    static let gray151 = "gray151"
    static let gray233 = "gray233"
}

struct Fonts{
    static let SFProTextMedium = "SFProText-Medium"
    static let SFCompactDisplayMedium = "SFCompactDisplay-Medium"
}

struct SegueIdentifiers{
    static let SignUpSuccess = "SignUpSuccess"
    static let LoginSuccess = "LoginSuccess"
    static let AlreadyLoggedIn = "AlreadyLoggedIn"
    static let SkipToHome = "SkipToHome"
    static let SkipToLogin = "SkipToLogin"
    static let CreatePetToDetails = "CreatePetToDetails"
    static let PetDetailsToDimensions = "PetDetailsToDimensions"
}
