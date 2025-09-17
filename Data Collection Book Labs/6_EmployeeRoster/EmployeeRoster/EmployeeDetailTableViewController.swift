
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {

    var employeeType: EmployeeType?

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    
    var isEditingBirthday: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
        updateSaveButtonState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            if let type = employeeType {
                employeeTypeLabel.text = type.description
                employeeTypeLabel.textColor = .label
            } else {
                employeeTypeLabel.text = "Select Employee Type"
                employeeTypeLabel.textColor = .secondaryLabel
            }
            updateSaveButtonState()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let datePickerIndexPath = IndexPath(row: 2, section: 0)
        
        if indexPath == datePickerIndexPath && isEditingBirthday == false {
            return 0
        }
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let dateLabelIndexPath = IndexPath(row: 1, section: 0)
        
        if indexPath == dateLabelIndexPath {
            isEditingBirthday.toggle()
            
            dobLabel.textColor = .label
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            dobLabel.text = formatter.string(from: dobDatePicker.date)
            
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    func employeeTypeTableViewController(_ controller: EmployeeTypeTableViewController, didSelect employeeType: EmployeeType) {
        self.employeeType = employeeType
        employeeTypeLabel.text = employeeType.description
        employeeTypeLabel.textColor = .black
        updateSaveButtonState()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    private func updateSaveButtonState() {
        let shouldEnableSaveButton = nameTextField.text?.isEmpty == false
        let shouldSelectEmployeeType = employeeType != nil
        saveBarButtonItem.isEnabled = shouldEnableSaveButton && shouldSelectEmployeeType
    }
    
    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
        print("✅ showEmployeeTypes called")
        let controller = EmployeeTypeTableViewController(coder: coder)
        controller?.delegate = self
        controller?.employeeType = employeeType
        return controller
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text,
            let employeeType = employeeType else {return}
        
        let selectedDate = dobDatePicker.date
        
        let employee = Employee(name: name, dateOfBirth: selectedDate, employeeType: employeeType)
        delegate?.employeeDetailTableViewController(self, didSave: employee)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true)
        
    }

    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }

    @IBAction func dobDateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        dobLabel.text = formatter.string(from: sender.date)
        dobLabel.textColor = .label
        updateSaveButtonState()
    }
}
