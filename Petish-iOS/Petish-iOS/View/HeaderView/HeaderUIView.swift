import UIKit

protocol HeaderViewDelegate{
    func goBack()
    func rightAction()
}

class HeaderUIView: UIView {
    var delegate: HeaderViewDelegate?
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let view = Bundle.main.loadNibNamed(Constants.headerViewNibName, owner: self, options: nil)?.first as? UIView
        view?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        view?.frame = bounds
        
        addSubview(view!)
    }
    
    
    @IBAction func backPressed(_ sender: UIButton) {
        delegate?.goBack()
    }
    
    
    @IBAction func rightPressed(_ sender: UIButton) {
        delegate?.rightAction()
    }
    
    func configureRightButton(title: String, hidden: Bool){
        rightButton?.isHidden = hidden
        rightButton?.setAttributedTitle( makeAttributedStringWith(title: title) , for: .normal)
        
    }
    
    func configureBackButton(title: String, hidden: Bool){
        backButton?.isHidden = hidden
        backButton?.setAttributedTitle( makeAttributedStringWith(title: title) , for: .normal)
    }
    
    
    func makeAttributedStringWith(title: String) -> NSAttributedString{
        let myString = title
        let myAttribute = [ NSAttributedString.Key.foregroundColor: UIColor(named: Colors.violetBlue), NSAttributedString.Key.font: UIFont(name: Fonts.SFProTextMedium, size: 14) ]
        let myAttrString = NSAttributedString(string: myString, attributes: myAttribute as [NSAttributedString.Key : Any])
        
        return myAttrString
    }
}
