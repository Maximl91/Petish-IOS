import UIKit

protocol SliderCellDelegate{
    func sliderChanged(data: Int, type: CellDataType)
}

class SliderCell: UITableViewCell {
    
    var delegate: SliderCellDelegate?
    private var cellDataType: CellDataType?
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if let type = cellDataType{
            delegate?.sliderChanged(data: Int(slider.value), type: type)
        }
    }
    
    func initCell(data: CellData){
        descriptionLabel.text = data.placeholder
        cellDataType = data.cellDataType
    }
}
