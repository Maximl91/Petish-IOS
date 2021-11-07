import UIKit

class PhotoCell: UICollectionViewCell {

    
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        //self.contentView.autoresizingMask.insert(.flexibleHeight)
        //self.contentView.autoresizingMask.insert(.flexibleWidth)
        
        contentView.frame = bounds
           contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func initCell(image: UIImage){
        imageView.image = image
    }
}
