import UIKit

class DatePickerCell: UITableViewCell {
    
    var delegate: TextFieldCellDelegate?
    private let datePicker = UIDatePicker()
    private let datePickerToolBar = UIToolbar()
    
    @IBOutlet weak var textField: BottomBorderTextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureDatePicker(datePicker)
        configureToolBar(datePickerToolBar)
    }
    
    @IBAction func textFieldEditBegin(_ sender: BottomBorderTextField) {
        textField.inputAccessoryView = datePickerToolBar
        textField.inputView = datePicker
    }
    
    func configureDatePicker(_ datePicker: UIDatePicker){
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .inline
    }
    
    func configureToolBar(_ toolBar: UIToolbar){
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()

        // Adds the buttons
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
    }
    
    @objc func doneClick() {
        let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
                dateFormatter.timeStyle = .none
        
        let formattedDateString = dateFormatter.string(from: datePicker.date)
        textField?.text = formattedDateString
        self.endEditing(true)
        
        delegate?.textFieldStateChanged(data: formattedDateString, type: .birthday, isValid: true)
    }

    @objc func cancelClick() {
        self.endEditing(true)
    }
    
    func initCell(data: CellData){
        textField?.placeholder = data.placeholder
        
    }
}
