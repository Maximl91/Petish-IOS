import UIKit

class PhotoCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initCell(image: UIImage){
        imageView.image = image
    }
}
