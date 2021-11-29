import UIKit
import FBSDKLoginKit

class SignInViewController: BaseViewController {
    
    let viewModel = SignInViewModel()
    var tableDataSource: MultiCellReuseableDataSource?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signInButton: FilledPurpleButton!
    @IBOutlet weak var loginWithFacebook: UIButton!
    @IBOutlet weak var loginErrLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableDataSource = MultiCellReuseableDataSource(cellsToDisplay: 2, data: viewModel.fieldPlaceholderArray, listener: self)
        headerView?.configureBackButton(title: "BACK", hidden: true)
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
    
    
    @IBAction func loginFacebookPressed(_ sender: Any) {
        viewModel.signInFacebookClicked(listener: self){ (errString: String?)-> Void in
            self.hideLoader()
            
            if errString == nil {
                self.performSegue(withIdentifier: SegueIdentifiers.LoginSuccess , sender: self)
            }
        }
    }
    
    override func rightAction() {
        self.performSegue(withIdentifier: SegueIdentifiers.SkipToHome , sender: self)
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


// MARK: - TextFieldCellDelegate

extension SignInViewController: MultiCellDelegate{
    func textFieldStateChanged(data: String, type: CellDataType, isValid: Bool){
        let dataToAdd = isValid ? data : Constants.invalidUserDataString
        
        viewModel.addUserData(dataToAdd, type){ [self]() -> Void in
            (isValid && viewModel.isUserDataReady()) ? signInButton.enable() : signInButton.disable()
        }
    }
    func sliderChanged(data: Int, type: CellDataType) {}
}

