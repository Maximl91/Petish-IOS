import UIKit

class SignUpViewController: BaseViewController {

    private let viewModel = SignUpViewModel()
    private var tableDataSource: TextFieldCellsReuseableDataSource?
    
    
    @IBOutlet weak var checkboxView: Checkbox!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signUpButton: FilledPurpleButton!
    @IBOutlet weak var signUpFacebook: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkboxView.delegate = self
        signUpButton.disable()
        signUpFacebook.isEnabled = false
        
        tableDataSource = TextFieldCellsReuseableDataSource(cellsToDisplay: 3, data: viewModel.fieldPlaceholderArray, listener: self)
        configureTableView()
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        showLoader()
        viewModel.signUpClicked(){(userId: String?, errString: String?) -> Void in
            self.hideLoader()
            
            if errString == nil {
                self.performSegue(withIdentifier: SegueIdentifiers.SignUpSuccess , sender: self)
            }
        }
    }
    
    @IBAction func withFacebookPressed(_ sender: UIButton) {
        showLoader()
        viewModel.signUpWithFacebookClicked(listener: self){(userId: String?, errString: String?) -> Void in
            self.hideLoader()
            
            if errString == nil {
                self.performSegue(withIdentifier: SegueIdentifiers.SignUpSuccess , sender: self)
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
    }
    
}

// MARK: - TextFieldCellDelegate

extension SignUpViewController: TextFieldCellDelegate{
    
    func textFieldStateChanged(data: String, type: FieldType, isValid: Bool){
        let dataToAdd = isValid ? data : Constants.invalidUserDataString
        
        viewModel.addUserData(dataToAdd, type){ [self]() -> Void in
    
            if (checkboxView.getState() && viewModel.isUserDataReady()){
               signUpButton.enable()
            }
            if !isValid{
                signUpButton.disable()
            }
        }
    }
}

// MARK: - CheckboxDelegate

extension SignUpViewController: CheckboxDelegate{
    func checkboxClicked(checkboxState: Bool) {
        if checkboxState{
            signUpFacebook.isEnabled = true
        }else{
            signUpFacebook.isEnabled = false
        }
        
        if (checkboxState && viewModel.isUserDataReady()){
            signUpButton.enable()
        }else{
            signUpButton.disable()
        }
    }
}
