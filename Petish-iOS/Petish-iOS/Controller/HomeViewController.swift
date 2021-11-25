import UIKit
import Firebase
import FBSDKLoginKit

class HomeViewController: UIViewController { // temp just for testing
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutPressed(_ sender: FilledPurpleButton) {
        if Auth.auth().currentUser?.uid != nil {
            do {
                try Auth.auth().signOut()
                dismiss(animated: false) {}
            } catch let signOutError as NSError {
                print ("Error signing out: %@", signOutError)
            }
        }
        else{
            let loginManager = LoginManager()
            
            if let _ = AccessToken.current { // Access token available -- user already logged in
                loginManager.logOut()
                dismiss(animated: false) {}
            }
        }
    }
}
