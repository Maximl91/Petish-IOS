import UIKit

class CreatePetDimensionsViewController: BaseViewController {

    var tableDataSource: TextFieldCellsReuseableDataSource?
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: FilledPurpleButton!
    
    let fieldPlaceholderArray = [
        CellData(placeholder: "Neck (INCH)", isSecure: false, cellType: CellType.textField, validateByType: textFieldType.petDimensions),
        CellData(placeholder: "Chest (INCH)", isSecure: false, cellType: CellType.textField, validateByType: textFieldType.petDimensions),
        CellData(placeholder: "Back (INCH)", isSecure: false, cellType: CellType.textField, validateByType: textFieldType.petDimensions)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView?.configureBackButton(title: "BACK", hidden: false)
        headerView?.configureRightButton(title: "SKIP", hidden: false)
        doneButton.disable()
        
        tableDataSource = TextFieldCellsReuseableDataSource(cellsToDisplay: 3, data: fieldPlaceholderArray, listener: self)
        configureTableView()
    }
    
    func configureTableView(){
        tableView.delegate = tableDataSource
        tableView.dataSource = tableDataSource
        registerCells(forTableView: tableView)
    }
    
    func registerCells(forTableView tableView: UITableView) {
        tableView.register(UINib(nibName: Constants.textFieldCellNibName, bundle: nil), forCellReuseIdentifier: Constants.textFieldCellReuseId)
    }
    
    override func goBack() {
        navigationController?.popViewController(animated: false)
    }
    
    override func rightAction() {
        self.performSegue(withIdentifier: SegueIdentifiers.SkipToHome , sender: self)
    }
    
}

extension CreatePetDimensionsViewController: TextFieldCellDelegate{
    func textFieldStateChanged(data: String, type: textFieldType, isValid: Bool) {
        
    }
}
