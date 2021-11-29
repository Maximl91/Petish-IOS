import UIKit
import DropDown

class DropMenuCell: UITableViewCell {
    
    private let dropDown = DropDown()
    var delegate: TextFieldCellDelegate?
    
    @IBOutlet weak var arrowView: UIImageView!
    @IBOutlet weak var vwDropDown: UIView!
    @IBOutlet weak var descriptionField: BottomBorderTextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        arrowView.image = #imageLiteral(resourceName: "downArrow")
        configureDropDown()
    }
    @IBAction func showDropDownMenu(_ sender: UIButton) {
            dropDown.show()
    }
    
    func configureDropDown(){
        dropDown.anchorView = vwDropDown
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
      
        configureDropDownEvents()
    }
    
    func configureDropDownEvents(){
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            descriptionField?.text = item
            arrowView.image = #imageLiteral(resourceName: "downArrow")
            // consider changing the type to a placeholder string?
            if item == Constants.clearSelection {
                descriptionField?.text = Constants.emptyString
                delegate?.textFieldStateChanged(data: Constants.emptyString, type: .none, isValid: true)
            }
            else{
            delegate?.textFieldStateChanged(data: item, type: .none, isValid: true)
            }
        }
        dropDown.cancelAction = { [unowned self] in
            arrowView.image = #imageLiteral(resourceName: "downArrow")
        }
        dropDown.willShowAction = { [unowned self] in
            arrowView.image = #imageLiteral(resourceName: "upArrow")
        }
    }
    
    func initCell(data: CellData, dataSource: [String]){
        descriptionField.placeholder = data.placeholder
        var arrayWithNoOptionals: [String] = data.dataSource.compactMap({$0})
        arrayWithNoOptionals.insert(contentsOf: [Constants.clearSelection], at: 0)
        dropDown.dataSource = arrayWithNoOptionals
    }
    
}
