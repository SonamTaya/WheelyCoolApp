//
//  ViewController.swift
//  WheelyCoolApp
//
//  Created by sonam taya on 16/2/22.
//

import UIKit

class ViewController: UIViewController {

    private var dataSource : InitialTableDataSource<SpinWheelItem>!

    let headerView = InitialHeaderView()
    let containerView = InitialContainerView()

    var items : [SpinWheelItem]? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        buttonTapped()
    }
    
    func setupView(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.topItem?.title = "Initial Screen"
        self.view.backgroundColor = .systemBackground
        view.addSubview(containerView)
        containerView.frame = view.frame
        headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 60)
        containerView.tableView.tableHeaderView = headerView
        headerView.textField.delegate = self
        updateDataSource()
       
    }
    
    func updateDataSource(){
        
        // Read/Get from userDefaults
        if let spinItems = UserDefaults.standard.value([SpinWheelItem].self, forKey: "spinWheelItem") {
            self.items = spinItems
            self.headerView.textField.text = ""
            self.headerView.textField.resignFirstResponder()
        }
        
        if  items?.count ?? 0 > 0{
        self.dataSource = InitialTableDataSource(items: items ?? [SpinWheelItem(title: "")], configureCell: { (cell, item) in
            cell.textLabel?.text = item.title
        })
        }
        DispatchQueue.main.async {
            self.containerView.tableView.dataSource = self.dataSource
            self.containerView.tableView.reloadData()
        }
    }

    func buttonTapped() {
        
        // Add Item Tapped
        self.headerView.buttonAddTextTapped = { [weak self] in
            
            //check if textfield is empty or not
            guard !(self?.headerView.textField.text ?? "").isEmptyString else { return }
                     
            // Create SpinItem
            let spinItem = SpinWheelItem(title: self?.headerView.textField.text ?? "")
            
            // Create Array of SpinItem
            var spinItemsArray = [spinItem]
           
            // check if items has already added if yes then append
            if  self?.items?.count ?? 0 > 0{
                spinItemsArray  =  (self?.items!)! + spinItemsArray
            }
            
            //set in userDefaults
            UserDefaults.standard.set(encodable: spinItemsArray, forKey: "spinWheelItem")
            self?.updateDataSource()

        }
        
        // done button tapped
        self.containerView.buttonDoneTapped = { [weak self] in
            print("button done tapped")
            if  self?.items?.count ?? 0 > 1{
                let wheelViewController = WheelViewController()

                // Read/Get from userDefaults
                if let spinItems = UserDefaults.standard.value([SpinWheelItem].self, forKey: "spinWheelItem") {
                wheelViewController.items = spinItems
                }

                self?.navigationController?.pushViewController(wheelViewController, animated: true)
            } else {
                let alert = UIAlertController(title: nil, message: "Please add at least 2 items", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default))
                self?.present(alert, animated: true)
            }
           
        }
    }
}



extension ViewController: UITextFieldDelegate {
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //Dismiss keyboard
        return true
    }
    }
