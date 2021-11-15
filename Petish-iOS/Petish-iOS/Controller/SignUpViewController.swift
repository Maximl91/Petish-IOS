import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var nameField: BottomBorderTextField!
    @IBOutlet weak var emailField: BottomBorderTextField!
    @IBOutlet weak var passwordField: BottomBorderTextField!
    
    @IBOutlet weak var checkboxView: Checkbox!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
    }
    
    @IBAction func withFacebookPressed(_ sender: UIButton) {
        print(checkboxView.getState()) // temp
    }
    
    
}

