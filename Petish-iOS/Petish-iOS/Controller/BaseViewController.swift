import UIKit
import Firebase
import FBSDKLoginKit

class BaseViewController: UIViewController, HeaderViewDelegate {
    
    internal let spinner = SpinnerViewController()
    @IBOutlet weak var headerView: HeaderUIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView?.delegate = self
        hideKeyboardWhenTappedAround()
        headerView?.configureBackButton(title: "BACK", hidden: false)
        headerView?.configureRightButton(title: "SKIP", hidden: false)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func getLoggedUserDetails()-> String?{
        // returns firebase uid
        if let userUid = Auth.auth().currentUser?.uid{
            return userUid
        }
        // returns facebook uid
        if let token = AccessToken.current, !token.isExpired {
            return token.userID
        }
        // not logged in
        return nil
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func rightAction() {}
    
    func showLoader(){
        addChild(spinner)
        view.addSubview(spinner.view)
    }
    
    func hideLoader(){
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
    
    func displayView(displayView: UIViewController){
        addChild(displayView)
        view.addSubview(displayView.view)
    }
    
    func dismissView(){
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}

