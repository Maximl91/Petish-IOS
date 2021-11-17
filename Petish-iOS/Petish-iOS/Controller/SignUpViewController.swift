import UIKit

class SignUpViewController: ExtendedViewController {

    private let viewModel = SignUpViewModel()

    @IBOutlet weak var checkboxView: Checkbox!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var signUpButton: FilledPurpleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkboxView.delegate = self
        signUpButton.disable()
        
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
        tableView.delegate = self
        tableView.dataSource = self
        registerCells(forTableView: tableView)
    }
    
    func registerCells(forTableView tableView: UITableView) {
        tableView.register(UINib(nibName: Constants.textFieldCellNibName, bundle: nil), forCellReuseIdentifier: Constants.textFieldCellReuseId)
    }
}

// MARK: - Delegate for TextField

extension SignUpViewController: UIViewControllerDelegate{
    
    func textFieldStateChanged(data: String, type: FieldType, isValid: Bool){
        if isValid{
            viewModel.addUserData(data, type){ [self]() -> Void in
        
                if (checkboxView.getState() && viewModel.isUserDataReady()){
                   signUpButton.enable()
                }
            }
        }else{
            signUpButton.disable()
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

// MARK: - UITableViewDataSource/Delegate

extension SignUpViewController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 3 }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.frame.height / 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.textFieldCellReuseId, for: indexPath) as! TextFieldCell
        cell.initCell(data: viewModel.fieldPlaceholderArray[indexPath.row])
        cell.delegate = self
        
        return cell
    }
}
