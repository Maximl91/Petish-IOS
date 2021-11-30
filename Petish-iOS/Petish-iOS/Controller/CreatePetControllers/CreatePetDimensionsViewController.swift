import UIKit

class CreatePetDimensionsViewController: BaseViewController {
    
    let viewModel = CreatePetDimensionsViewModel()
    var tableDataSource: MultiCellReuseableDataSource?
    
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
        
        guard let userId = self.getLoggedUserDetails() else{
            print("error user is not logged-in!")
            return
        }
        print(userId) // to display who
        
        showLoader()
        viewModel.createFirstPetProfile(imageData: viewModel.petData?.image ,userId: userId){ (userId: String?, error: String?)->Void in
                self.hideLoader()
                
                if error == nil{
                    // completed pet creation
                    // segue to next screen
                }
        }
    }
    
    func viewInitialSettings(){
        if let pet = viewModel.petData{
            titleLabel.text = "\(pet.name)'s Dimensions"
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
        navigationController?.popViewController(animated: true)
    }
    
    override func rightAction() {
        self.performSegue(withIdentifier: SegueIdentifiers.SkipToHome , sender: self)
    }
    
}

extension CreatePetDimensionsViewController: MultiCellDelegate{
    func textFieldStateChanged(data: String, type: CellDataType, isValid: Bool) {
        viewModel.addPetData(data, type){ () -> Void in
        }
    }
    func sliderChanged(data: Int, type: CellDataType) {}
}
