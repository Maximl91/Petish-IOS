import UIKit

class CreatePetViewController: BaseViewController {

    @IBOutlet weak var petUIView: UIView!
    @IBOutlet weak var petImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad() // temp
        configurePetUIView()
    }
    
    func configurePetUIView(){
        petUIView.layer.cornerRadius = 60
        petImageView.image = #imageLiteral(resourceName: "AddCross")
    }
}
