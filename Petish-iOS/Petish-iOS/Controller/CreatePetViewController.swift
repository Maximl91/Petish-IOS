import UIKit

class CreatePetViewController: BaseViewController {

    @IBOutlet weak var petUIView: UIView!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInitialSettings()
    }
    
    func viewInitialSettings(){ // to be changed
        petUIView.layer.cornerRadius = 60
        petImageView.layer.cornerRadius = 60
        petImageView.contentMode = .center
        petImageView.image = #imageLiteral(resourceName: "AddCross")
    }
    
    @IBAction func addPhotoPressed(_ sender: UIButton) {
        let popUpView = AddPictureOverlayViewController()
        popUpView.delegate = self
        displayView(displayView: popUpView)
    }
}

extension CreatePetViewController: AddPictureOverlayDelegate{
    func resetImage() {
        viewInitialSettings()
    }
    
    func setImage(image: UIImage) {
        petImageView.image = image
        descriptionLabel.text = "EDIT PHOTO"
        petImageView.contentMode = .scaleAspectFill
    }
}
