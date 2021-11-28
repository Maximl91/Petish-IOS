import UIKit

protocol SliderCellDelegate{
    func sliderChanged(data: Int)
}

class SliderCell: UITableViewCell {

    
    var delegate: SliderCellDelegate?
    
    @IBOutlet weak var slider: UISlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        let image:UIImage? = // ...
//        slider.setThumbImage(image, for: .normal)
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        delegate?.sliderChanged(data: Int(slider.value))
    }
}
