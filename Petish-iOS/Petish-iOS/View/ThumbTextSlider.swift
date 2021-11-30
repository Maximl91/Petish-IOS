import UIKit

class ThumbTextSlider: UISlider {
    var thumbTextLabel: UILabel = UILabel()
    
    private var thumbFrame: CGRect {
        let newBounds = CGRect(x: bounds.minX, y: bounds.minY, width: bounds.width, height: bounds.height-45)
        
        return thumbRect(forBounds: newBounds, trackRect: trackRect(forBounds: newBounds), value: value)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var newWidth = thumbFrame
        newWidth.size.width = newWidth.width+5
        thumbTextLabel.frame = newWidth
        thumbTextLabel.text = "\(Int(value).description) kg"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(thumbTextLabel)
        configureThumbTextLabel()
    }
    
    func configureThumbTextLabel(){
        thumbTextLabel.textColor = UIColor.init(named: Colors.violetBlue)
        thumbTextLabel.font = UIFont(name: Fonts.SFCompactDisplayMedium, size: 14)
        thumbTextLabel.textAlignment = .center
        thumbTextLabel.layer.zPosition = layer.zPosition + 1
    }
}
