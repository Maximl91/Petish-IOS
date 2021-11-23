import UIKit

class AddPictureOverlayViewController: BaseViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary

    }
    
    
    @IBAction func closeOverlay(_ sender: UIButton) {
        dismissView()
    }
    
    @IBAction func takePicturePressed(_ sender: UIButton) {
    }
    
    @IBAction func fromGalleryPressed(_ sender: UIButton) {
        self.present(imagePickerController, animated: true, completion: nil)
    }
}
