//
//  WheelViewController.swift
//  WheelyCoolApp
//
//  Created by sonam taya on 16/2/22.
//

import UIKit

class WheelViewController: UIViewController {
    var wheel : SpinWheel?
    var items = [SpinWheelItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        setUpView()
    }
    
    func setUpView() {
        setUpSpinButton()
        wheel = SpinWheel(frame: CGRect(x: 0, y: 0, width: view.frame.width / 1.2 , height: 300))
        wheel?.delegate = self
        wheel?.dataSource = self
        wheel?.center = self.view.center
        wheel?.animateLanding = true
        self.view.addSubview(wheel!)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        //wheel set on random option
        wheel?.setTarget(section: (items.indices.randomElement() ?? 0) + 1)
        wheel?.isAnimating = true
        wheel?.rotate()
    }
    
    func setUpSpinButton(){
        let button = UIButton()
        button.backgroundColor = UIColor.systemGray3
        button.setTitle("Spin", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.6).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -30).isActive = true
    }
    
}

//MARK: Spin view datasource
extension WheelViewController : SpinWheelDataSource {
    func numberOfSections() -> Int {
        return items.count
    }
    
    func itemsForSections() -> [SpinWheelItem] {
        return items
    }
}

//MARK: Spin view delegate
extension WheelViewController : SpinWheelDelegate {
    func landingPostion() -> LandingPostion {
        return .bottom
    }
    
    func wheelDidChangeValue(_ newValue: Int) {
        if items.count > newValue-1 && newValue > 0{
            print(items[newValue-1].title ?? "none")
        }
    }
}
