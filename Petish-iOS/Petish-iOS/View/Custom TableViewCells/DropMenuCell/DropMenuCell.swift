import UIKit
import DropDown

class DropMenuCell: UITableViewCell {
    
    private let dropDown = DropDown()
    var delegate: TextFieldCellDelegate?
    private var cellDataType: CellDataType?
    
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
            arrowView.image = #imageLiteral(resourceName: "downArrow")
            if let typeToSet = cellDataType{
                
                let textToSet = (item == Constants.clearSelection) ? Constants.emptyString : item
                descriptionField?.text = textToSet
                delegate?.textFieldStateChanged(data: textToSet, type: typeToSet, isValid: true)
            }
        }
        dropDown.cancelAction = { ()->Void in
            self.arrowView.image = #imageLiteral(resourceName: "downArrow")
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
        cellDataType = data.cellDataType
    }
    
}
