import UIKit

class SignUpViewController: UIViewController {

    private let viewModel = SignUpViewModel()
    
    @IBOutlet weak var checkboxView: Checkbox!
    
    @IBOutlet weak var test: BottomBorderTextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        registerCells(forTableView: tableView)
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        // loop on all itemCells
        let itemCell = tableView.cellForRow(at: [1,0]) as! TextFieldCell
        let temp = itemCell.isValid()
        
        if !checkboxView.getState() {
            // error or alert
        }
        else{
            // sign-up
        }
    }
    
    @IBAction func withFacebookPressed(_ sender: UIButton) {
        // with firebase?
    }
    
    func registerCells(forTableView tableView: UITableView) {
        tableView.register(UINib(nibName: Constants.textFieldCellNibName, bundle: nil), forCellReuseIdentifier: Constants.textFieldCellReuseId)
        }
}

extension SignUpViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int { return viewModel.getPlaceholderArray().count }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat { return 17.0 }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
           return UIView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.textFieldCellReuseId, for: indexPath) as! TextFieldCell
        
        cell.initCell(with: viewModel, cellIndex: indexPath.section)
        return cell
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
