import UIKit

class CreatePetDetailsViewController: BaseViewController {
    
    var tableDataSource: TextFieldCellsReuseableDataSource?
    let fieldPlaceholderArray = [
        TextFieldData(placeholder: "Email", isSecure: false, validateByType: FieldType.email),
        TextFieldData(placeholder: "Email", isSecure: false, validateByType: FieldType.email),
        TextFieldData(placeholder: "Email", isSecure: false, validateByType: FieldType.email),
        TextFieldData(placeholder: "Email", isSecure: false, validateByType: FieldType.email),
        TextFieldData(placeholder: "Email", isSecure: false, validateByType: FieldType.email)
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView?.configureBackButton(title: "BACK", hidden: false)
        headerView?.configureRightButton(title: "SKIP", hidden: false)
        
        tableDataSource = TextFieldCellsReuseableDataSource(cellsToDisplay: 5, data: fieldPlaceholderArray, listener: self)
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

extension CreatePetDetailsViewController: TextFieldCellDelegate{
    func textFieldStateChanged(data: String, type: FieldType, isValid: Bool) {
        
    }
}
