import UIKit

class TextFieldCellsReuseableDataSource: NSObject {
    
    private let textFieldStateListener: TextFieldCellDelegate
    private let fieldPlaceholderArray: [TextFieldData]
    private let displayedCells: CGFloat
    
    init(cellsToDisplay: CGFloat, data: [TextFieldData], listener: TextFieldCellDelegate){
        textFieldStateListener = listener
        fieldPlaceholderArray = data
        displayedCells = cellsToDisplay
    }
}

extension TextFieldCellsReuseableDataSource: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return fieldPlaceholderArray.count }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.frame.height / displayedCells
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.textFieldCellReuseId, for: indexPath) as! TextFieldCell
        cell.initCell(data: fieldPlaceholderArray[indexPath.row])
        cell.delegate = textFieldStateListener
        
        return cell
    }
}
