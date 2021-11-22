import UIKit

class BaseViewController: UIViewController {
    
    internal let spinner = SpinnerViewController()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showLoader(){
        addChild(spinner)
        view.addSubview(spinner.view)
    }
    
    func hideLoader(){
        spinner.view.removeFromSuperview()
        spinner.removeFromParent()
    }
}
