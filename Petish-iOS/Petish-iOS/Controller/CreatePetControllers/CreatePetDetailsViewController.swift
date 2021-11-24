import UIKit

class CreatePetDetailsViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView?.configureBackButton(title: "BACK", hidden: false)
        headerView?.configureRightButton(title: "SKIP", hidden: false)
    }
    
    override func goBack() {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func rightAction() {
        self.performSegue(withIdentifier: SegueIdentifiers.SkipToHome , sender: self)
    }
}
