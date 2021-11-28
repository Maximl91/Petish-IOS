import UIKit

protocol MultiCellDelegate: TextFieldCellDelegate, SliderCellDelegate{
    
    
}

class MultiCellReuseableDataSource: NSObject {
    
    private let multiCellStateListener: MultiCellDelegate
    private let fieldPlaceholderArray: [CellData]
    private let displayedCells: CGFloat
    
    init(cellsToDisplay: CGFloat, data: [CellData], listener: MultiCellDelegate){
        multiCellStateListener = listener
        fieldPlaceholderArray = data
        displayedCells = cellsToDisplay
    }
}

extension MultiCellReuseableDataSource: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return fieldPlaceholderArray.count }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.frame.height / displayedCells)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if fieldPlaceholderArray[indexPath.row].cellType == CellType.slider{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.sliderCellReuseId, for: indexPath) as! SliderCell
        
            cell.delegate = multiCellStateListener
            return cell
        }
        else if fieldPlaceholderArray[indexPath.row].cellType == CellType.dropMenu {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.dropMenuCellReuseId, for: indexPath) as! DropMenuCell

            return cell
        }
        else if fieldPlaceholderArray[indexPath.row].cellType == CellType.datePicker {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.datePickerCellReuseId, for: indexPath) as! DatePickerCell
            cell.initCell(data: fieldPlaceholderArray[indexPath.row])
            cell.delegate = multiCellStateListener
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.textFieldCellReuseId, for: indexPath) as! TextFieldCell
            cell.initCell(data: fieldPlaceholderArray[indexPath.row])
            cell.delegate = multiCellStateListener
            return cell
        }
        
       
    }
}
