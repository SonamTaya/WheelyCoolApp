//
//  InitialView.swift
//  WheelyCoolApp
//
//  Created by sonam taya on 16/2/22.
//

import UIKit

class InitialHeaderView: UIView {
    
    let viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let textField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .bezel
        tf.placeholder = "Enter item here..."
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let buttonAddText: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.systemGray3
        btn.setTitle("  Add Item  ", for: .normal)

        btn.addTarget(self, action: #selector(buttonAddTextTapped(_:)), for: .touchUpInside)
        btn.setTitleColor(.label, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    
    var buttonAddTextTapped: (()->Void)?
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAddTextTapped(_ sender: UIButton) {
           if let buttonAction = self.buttonAddTextTapped {
               buttonAction()
           }
       }
    
 
    // MARK: - Setup
    private func setupView() {
        
        addSubview(viewBackground)
        viewBackground.addSubview(textField)
        viewBackground.addSubview(buttonAddText)

        NSLayoutConstraint.activate([
            viewBackground.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            viewBackground.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            viewBackground.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            
            textField.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 5),
            textField.leftAnchor.constraint(equalTo: viewBackground.leftAnchor, constant: 5),
            textField.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: 5),
            
            buttonAddText.topAnchor.constraint(equalTo: textField.topAnchor, constant: 0),
            buttonAddText.leftAnchor.constraint(equalTo: textField.rightAnchor, constant: 15),
            buttonAddText.rightAnchor.constraint(equalTo: viewBackground.rightAnchor, constant: 5),
            buttonAddText.bottomAnchor.constraint(equalTo: textField.bottomAnchor, constant: 0),
            buttonAddText.widthAnchor.constraint(equalToConstant: 130)

        ])
        
    }
    
}
