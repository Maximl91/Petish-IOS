import UIKit

class CreatePetDimensionsViewController: BaseViewController {
    
    private let viewModel = CreatePetDimensionsViewModel()
    var tableDataSource: TextFieldCellsReuseableDataSource?
    var petData: PetData?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: FilledPurpleButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDataSource = TextFieldCellsReuseableDataSource(cellsToDisplay: 3, data: viewModel.fieldPlaceholderArray, listener: self)
        viewInitialSettings()
        configureTableView()
    }
    
    func viewInitialSettings(){
        doneButton.disable()
        
        if let temp = petData{
            titleLabel.text = "\(temp.name)'s Dimensions"
        }
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
