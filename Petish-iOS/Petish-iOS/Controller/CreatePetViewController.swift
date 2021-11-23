import UIKit

class CreatePetViewController: BaseViewController {

    @IBOutlet weak var petUIView: UIView!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewInitialSettings()
    }
    
    func viewInitialSettings(){ 
        petUIView.layer.cornerRadius = 75
        petImageView.layer.cornerRadius = 75
        descriptionLabel.text = "Add a photo of your pet"
        petImageView.contentMode = .center
        petImageView.image = #imageLiteral(resourceName: "AddCross")
    }
    
    @IBAction func addPhotoPressed(_ sender: UIButton) {
        let overlayView = AddPictureOverlayViewController()
        overlayView.delegate = self
        displayView(displayView: overlayView)
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
