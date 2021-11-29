import UIKit

class CreatePetDetailsViewController: BaseViewController {
    
    private let viewModel = CreatePetDetailsViewModel()
    var seguePassedPetImageDetails: PetImageDetails? // nil if no image
    var tableDataSource: MultiCellReuseableDataSource?
    
    @IBOutlet weak var nextButton: FilledPurpleButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableDataSource = MultiCellReuseableDataSource(cellsToDisplay: 5, data: viewModel.fieldPlaceholderArray, listener: self)
        nextButton.disable()
        configureTableView()
    }
    
    @IBAction func nextButton(_ sender: FilledPurpleButton) {
        self.performSegue(withIdentifier: SegueIdentifiers.PetDetailsToDimensions , sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == SegueIdentifiers.PetDetailsToDimensions) {
            if let vc = segue.destination as? CreatePetDimensionsViewController {
                vc.petData = viewModel.getPetData()
            }
        }
    }
    
    func configureTableView(){
        tableView.delegate = tableDataSource
        tableView.dataSource = tableDataSource
        registerCells(forTableView: tableView)
    }
    
    func registerCells(forTableView tableView: UITableView) {
        tableView.register(UINib(nibName: Constants.textFieldCellNibName, bundle: nil), forCellReuseIdentifier: Constants.textFieldCellReuseId)
        
        tableView.register(UINib(nibName: Constants.sliderCellNibName, bundle: nil), forCellReuseIdentifier: Constants.sliderCellReuseId)
        
        tableView.register(UINib(nibName: Constants.dropMenuCellNibName, bundle: nil), forCellReuseIdentifier: Constants.dropMenuCellReuseId)
        
        tableView.register(UINib(nibName: Constants.datePickerCellNibName, bundle: nil), forCellReuseIdentifier: Constants.datePickerCellReuseId)
    }
    
    override func goBack() {
        navigationController?.popViewController(animated: false)
    }
    
    override func rightAction() {
        self.performSegue(withIdentifier: SegueIdentifiers.SkipToHome , sender: self)
    }
}

extension CreatePetDetailsViewController: MultiCellDelegate{
    func textFieldStateChanged(data: String, type: CellDataType, isValid: Bool) {
        viewModel.addPetData(data, type){ () -> Void in
            self.viewModel.isReady() ? self.nextButton.enable() : self.nextButton.disable()
        }
    }
    
    func sliderChanged(data: Int, type: CellDataType) {
        viewModel.addPetData(String(data), type){ () -> Void in }
    }
}
