//
//  InitialFooterView.swift
//  WheelyCoolApp
//
//  Created by sonam taya on 16/2/22.
//

import UIKit

class InitialContainerView: UIView {
    
    let viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "TableCell")
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let buttonDone: UIButton = {
        let btn = UIButton()
        btn.setTitle("  Done  ", for: .normal)
        btn.backgroundColor = UIColor.systemGray3
        btn.addTarget(self, action: #selector(buttonDoneTapped(_:)), for: .touchUpInside)
        btn.setTitleColor(.label, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    
    var buttonDoneTapped: (()->Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonDoneTapped(_ sender: UIButton) {
           if let buttonAction = self.buttonDoneTapped {
               buttonAction()
           }
       }
    
 
    // MARK: - Setup
    private func setupView() {
        
        addSubview(viewBackground)
        viewBackground.addSubview(tableView)
        viewBackground.addSubview(buttonDone)

        NSLayoutConstraint.activate([
            viewBackground.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            viewBackground.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            viewBackground.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1),
            viewBackground.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            viewBackground.topAnchor.constraint(equalTo: self.topAnchor, constant: 1),

            tableView.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            tableView.centerYAnchor.constraint(equalTo: viewBackground.centerYAnchor),
            tableView.widthAnchor.constraint(equalTo: viewBackground.widthAnchor, multiplier: 1),
            
            buttonDone.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            buttonDone.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor),
            buttonDone.heightAnchor.constraint(equalToConstant: 50),
            buttonDone.centerXAnchor.constraint(equalTo: viewBackground.centerXAnchor),
            buttonDone.widthAnchor.constraint(equalTo: viewBackground.widthAnchor, multiplier: 0.6),
        ])
        
    }
    
}
