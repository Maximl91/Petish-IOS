import UIKit

protocol SliderCellDelegate{
    func sliderChanged(data: Int)
}

class SliderCell: UITableViewCell {
    
    var delegate: SliderCellDelegate?
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        delegate?.sliderChanged(data: Int(slider.value))
    }
    
    func initCell(data: CellData){
        descriptionLabel.text = data.placeholder
    }
}
