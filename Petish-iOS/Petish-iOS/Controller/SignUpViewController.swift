import UIKit

class SignUpViewController: UIViewController {

    private let viewModel = SignUpViewModel()

    @IBOutlet weak var checkboxView: Checkbox!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var checkboxErrLabel: UILabel!
    @IBOutlet weak var signUpButton: FilledPurpleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkboxErrLabel.isHidden = true
        signUpButton.disable()
        configureTableView()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        let checkboxState = checkboxView.getState()
        // displays error label if checkbox left unchecked
        checkboxErrLabel.isHidden = checkboxState
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
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

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

extension SignUpViewController: SignUpViewControllerDelegate{
    
    func addValidatedTextData(data: String, type: FieldType){
        viewModel.addUserData(data, type){() -> Void in
            if self.checkboxView.getState(){
                self.signUpButton.enable()
            }
        }
    }
}
