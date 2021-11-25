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
    
    @IBAction func nextButton(_ sender: FilledPurpleButton) {
        self.performSegue(withIdentifier: SegueIdentifiers.CreatePetToDetails , sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == SegueIdentifiers.CreatePetToDetails) {
            if let detailVC = segue.destination as? CreatePetDetailsViewController {
                //detailVC.passedVal = viewModel.getPassedVal()
            }
        }
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
