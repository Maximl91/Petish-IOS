import UIKit

protocol AddPictureOverlayDelegate{
    func setImage(image: UIImage)
    func resetImage()
}

class AddPictureOverlayViewController: BaseViewController {

    private var imageToSet: UIImage?
    var delegate: AddPictureOverlayDelegate?

    @IBOutlet weak var uploadButton: FilledPurpleButton!
    
    let imagePickerController = UIImagePickerController()
    
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
        if let image = imageToSet{
            delegate?.setImage(image: image)
        }
        dismissView()
    }
}

extension AddPictureOverlayViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\(info)") // debug
        imageToSet = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        uploadButton.enable()
    }
}
