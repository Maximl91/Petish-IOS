import UIKit

class CreatePetViewController: BaseViewController {

    let popUpView = AddPictureOverlayViewController()
    
    @IBOutlet weak var petUIView: UIView!
    @IBOutlet weak var petImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePetUIView()
    }
    
    func configurePetUIView(){ // to be changed
        petUIView.layer.cornerRadius = 60
    }
    
    @IBAction func addPhotoPressed(_ sender: UIButton) {
        displayView(displayView: popUpView)
    }
}
