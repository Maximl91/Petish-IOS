import UIKit

class BaseViewController: UIViewController, HeaderViewDelegate {
    func goBack() {
        print("base")
        self.dismiss(animated: false, completion: nil)
    }
    
    func rightAction() {}
    
    
    internal let spinner = SpinnerViewController()
    @IBOutlet weak var headerView: HeaderUIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        headerView?.delegate = self
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
    
    func displayView(displayView: UIViewController){
        addChild(displayView)
        view.addSubview(displayView.view)
    }
    
    func dismissView(){
        self.view.removeFromSuperview()
        self.removeFromParent()
    }
}
