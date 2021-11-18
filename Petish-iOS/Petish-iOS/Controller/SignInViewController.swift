import UIKit

class SignInViewController: ExtendedViewController {

    let viewModel = SignInViewModel()
    var tableDataSource: TextFieldCellsReuseableDataSourceDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signInButton: FilledPurpleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDataSource = TextFieldCellsReuseableDataSourceDelegate(cellsToDisplay: 2, data: viewModel.fieldPlaceholderArray, cellDelegate: self)
        signInButton.disable()
        configureTableView()
    }
    
    
    @IBAction func loginPressed(_ sender: FilledPurpleButton) {
        viewModel.signInClicked(){ ()-> Void in
            self.performSegue(withIdentifier: SegueIdentifiers.LoginSuccess , sender: self)
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
}

extension SignInViewController: UIViewControllerDelegate{
    
    func textFieldStateChanged(data: String, type: FieldType, isValid: Bool){
        let dataToAdd = isValid ? data : Constants.invalidUserDataString

        viewModel.addUserData(dataToAdd, type){ [self]() -> Void in
            (isValid && viewModel.isUserDataReady()) ? signInButton.enable() : signInButton.disable()
        }
    }
}

