import UIKit

class Checkbox: UIView {
    
    // state indicates if the checkbox is marked or not
    private var state: Bool = false
    private var image: UIImage = #imageLiteral(resourceName: "Checked")

    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
        let view = Bundle.main.loadNibNamed(Constants.checkboxNibName, owner: self, options: nil)?.first as? UIView
            view?.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            view?.frame = bounds
            addSubview(view!)
        }
    
    @IBAction func checkPressed(_ sender: UIButton) {
        state = !state 
        imageView.image = state ? image : nil
    }
    
    func getState() -> Bool {
        return state
    }
}
