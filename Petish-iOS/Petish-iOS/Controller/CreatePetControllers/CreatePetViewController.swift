import UIKit

class CreatePetViewController: BaseViewController {
 
    @IBOutlet weak var petUIView: UIView!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
        override func viewDidLoad() {
        super.viewDidLoad()
        headerView?.configureBackButton(title: "BACK", hidden: true)
        headerView?.configureRightButton(title: "SKIP", hidden: false)
        
        viewInitialSettings()
    }
    
    @IBAction func addPhotoPressed(_ sender: UIButton) {
        let overlayView = AddPictureOverlayViewController()
        overlayView.delegate = self
        displayView(displayView: overlayView)
    }
    
    func viewInitialSettings(){
        petUIView.layer.cornerRadius = 75
        petImageView.layer.cornerRadius = 75
        descriptionLabel.text = "Add a photo of your pet"
        petImageView.contentMode = .center
        petImageView.image = #imageLiteral(resourceName: "AddCross")
    }
    
    override func rightAction() {
        self.performSegue(withIdentifier: SegueIdentifiers.SkipToHome , sender: self)
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

// MARK: - HeaderViewDelegate

//extension CreatePetViewController: HeaderViewDelegate {
//    func goBack() {
//        print("hello")
//        //self.dismiss(animated: false, completion: nil)
//    }
//
//    func rightAction() {
//        print("hi")
//    }
//}
