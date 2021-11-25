import UIKit

class CreatePetDetailsViewController: BaseViewController {
    
    var seguePassedPetImage: PetImageDetails?
    
    private let viewModel = CreatePetDetailsViewModel()
    var tableDataSource: TextFieldCellsReuseableDataSource?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView?.configureBackButton(title: "BACK", hidden: false)
        headerView?.configureRightButton(title: "SKIP", hidden: false)
      
        tableDataSource = TextFieldCellsReuseableDataSource(cellsToDisplay: 5, data: viewModel.fieldPlaceholderArray, listener: self)
        configureTableView()

    }
    
    @IBAction func nextButton(_ sender: FilledPurpleButton) {
        self.performSegue(withIdentifier: SegueIdentifiers.PetDetailsToDimensions , sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == SegueIdentifiers.PetDetailsToDimensions) {
            if let detailVC = segue.destination as? CreatePetDimensionsViewController {
                //detailVC.passedVal = viewModel.getPassedVal()
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
    }
    
    override func goBack() {
        navigationController?.popViewController(animated: false)
    }
    
    override func rightAction() {
        self.performSegue(withIdentifier: SegueIdentifiers.SkipToHome , sender: self)
    }
}

extension CreatePetDetailsViewController: TextFieldCellDelegate{
    func textFieldStateChanged(data: String, type: textFieldType, isValid: Bool) {
        
    }
}
