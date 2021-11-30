import UIKit

protocol AddPictureOverlayDelegate{
    func setImage(data: UIImage)
    func resetImage()
}

class AddPictureOverlayViewController: BaseViewController {
    
//    private var petImageDetails: PetImageDetails?
    private var petImage: UIImage?
    var delegate: AddPictureOverlayDelegate?
    let imagePickerController = UIImagePickerController()
    
    @IBOutlet weak var uploadButton: FilledPurpleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uploadButton.disable()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
    }
    
    @IBAction func closeOverlay(_ sender: UIButton) {
        dismissView()
    }
    
    @IBAction func fromGalleryPressed(_ sender: UIButton) {
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func resetPressed(_ sender: TransparentPurpleButton) {
        delegate?.resetImage()
        dismissView()
    }
    
    @IBAction func uploadPressed(_ sender: FilledPurpleButton) {
        if let data = petImage{
            delegate?.setImage(data: data)
        }
        dismissView()
    }
}

extension AddPictureOverlayViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let petImage = info[.originalImage] as? UIImage {
            self.petImage = petImage
        }
        self.dismiss(animated: true, completion: nil)
        uploadButton.enable()
    }
}
