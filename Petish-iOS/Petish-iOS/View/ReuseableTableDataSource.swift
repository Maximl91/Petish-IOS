import UIKit


//class ReuseableTableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate{
//
//    func numberOfSections(in tableView: UITableView) -> Int { return 1 }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 3 }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        tableView.frame.height / 3
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.textFieldCellReuseId, for: indexPath) as! TextFieldCell
//        cell.initCell(data: viewModel.fieldPlaceholderArray[indexPath.row])
//        viewModel.arrayOfCells += [cell]
//
//        return cell
//    }
//}
