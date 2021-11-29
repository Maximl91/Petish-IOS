import UIKit

class CreatePetDimensionsViewController: BaseViewController {
    
    private let viewModel = CreatePetDimensionsViewModel()
    var tableDataSource: MultiCellReuseableDataSource?
    var petData: PetData?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var doneButton: FilledPurpleButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDataSource = MultiCellReuseableDataSource(cellsToDisplay: 3, data: viewModel.fieldPlaceholderArray, listener: self)
        viewInitialSettings()
        configureTableView()
    }
    
    
    @IBAction func donePressed(_ sender: FilledPurpleButton) {
        
    }
    
    func viewInitialSettings(){
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

extension CreatePetDimensionsViewController: MultiCellDelegate{
    func textFieldStateChanged(data: String, type: CellDataType, isValid: Bool) {}
    func sliderChanged(data: Int, type: CellDataType) {}
}
