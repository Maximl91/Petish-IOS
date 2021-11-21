import UIKit

class SignUpViewController: ExtendedViewController {

    private let viewModel = SignUpViewModel()
    private var tableDataSource: TextFieldCellsReuseableDataSource?
    
    
    @IBOutlet weak var checkboxView: Checkbox!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signUpButton: FilledPurpleButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkboxView.delegate = self
        signUpButton.disable()
        tableDataSource = TextFieldCellsReuseableDataSource(cellsToDisplay: 3, data: viewModel.fieldPlaceholderArray, cellDelegate: self)
        configureTableView()
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        let checkboxState = checkboxView.getState()
        viewModel.signUpClicked(isCheckboxMarked: checkboxState){() -> Void in
            self.performSegue(withIdentifier: SegueIdentifiers.SignUpSuccess , sender: self)
        }
    }
    
    @IBAction func withFacebookPressed(_ sender: UIButton) {
        // with firebase
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

// MARK: - UIViewControllerDelegate

extension SignUpViewController: UIViewControllerDelegate{
    
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

// MARK: - Delegate for Checkbox

extension SignUpViewController: CheckboxDelegate{
    func checkboxClicked(checkboxState: Bool) {
        if (checkboxState && viewModel.isUserDataReady()){
            signUpButton.enable()
        }else{
            signUpButton.disable()
        }
    }
}
