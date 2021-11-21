import UIKit

class SignInViewController: ExtendedViewController {

    let viewModel = SignInViewModel()
    var tableDataSource: TextFieldCellsReuseableDataSource?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signInButton: FilledPurpleButton!
    @IBOutlet weak var loginErrLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDataSource = TextFieldCellsReuseableDataSource(cellsToDisplay: 2, data: viewModel.fieldPlaceholderArray, cellDelegate: self)
        viewInitialSettings()
        configureTableView()
    }
    
    
    @IBAction func loginPressed(_ sender: FilledPurpleButton) {
        showLoader()
        viewModel.signInClicked(){ (errString: String?)-> Void in
            self.hideLoader()
            
            if errString != nil {
                self.loginErrLabel.isHidden = false
            }else{
                self.performSegue(withIdentifier: SegueIdentifiers.LoginSuccess , sender: self)
            }
        }
    }
    
    func viewInitialSettings(){
        loginErrLabel.isHidden = true
        signInButton.disable()
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

