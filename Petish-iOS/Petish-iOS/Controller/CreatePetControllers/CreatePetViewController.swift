import UIKit

class CreatePetViewController: BaseViewController {
    
    private var petImage: UIImage?
    @IBOutlet weak var petUIView: UIView!
    @IBOutlet weak var petImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView?.configureBackButton(title: "BACK", hidden: true)
        viewInitialSettings()
    }
    
    @IBAction func addPhotoPressed(_ sender: UIButton) {
        let overlayView = AddPictureOverlayViewController()
        overlayView.delegate = self
        displayView(displayView: overlayView)
    }
    
    @IBAction func nextButton(_ sender: FilledPurpleButton) {
  
        let vc: CreatePetDetailsViewController = (UIStoryboard.init(name: Storyboards.CreatePetStoryboard, bundle: Bundle.main).instantiateViewController(withIdentifier: Storyboards.CreatePet.CreatePetDetailsViewController) as! CreatePetDetailsViewController)
    
        if let image = petImage{
            vc.viewModel.setPetImage(image: image)
        }
        navigationController?.pushViewController(vc, animated: true)
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
    
    func setImage(data: UIImage) {
        petImage = data
        petImageView.image = data
        descriptionLabel.text = "EDIT PHOTO"
        petImageView.contentMode = .scaleAspectFill
    }
}
