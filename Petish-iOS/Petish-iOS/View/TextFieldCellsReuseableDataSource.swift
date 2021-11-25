import UIKit

class TextFieldCellsReuseableDataSource: NSObject {
    
    private let textFieldStateListener: TextFieldCellDelegate
    private let fieldPlaceholderArray: [CellData]
    private let displayedCells: CGFloat
    
    init(cellsToDisplay: CGFloat, data: [CellData], listener: TextFieldCellDelegate){
        textFieldStateListener = listener
        fieldPlaceholderArray = data
        displayedCells = cellsToDisplay
    }
}

extension TextFieldCellsReuseableDataSource: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return fieldPlaceholderArray.count }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.frame.height / displayedCells)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if fieldPlaceholderArray[indexPath.row].cellType == CellType.slider{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.sliderCellReuseId, for: indexPath) as! SliderCell
            //cell.initCell(data: fieldPlaceholderArray[indexPath.row])
            //cell.delegate = textFieldStateListener
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.textFieldCellReuseId, for: indexPath) as! TextFieldCell
            cell.initCell(data: fieldPlaceholderArray[indexPath.row])
            cell.delegate = textFieldStateListener
            return cell
        }
        
       
    }
}
