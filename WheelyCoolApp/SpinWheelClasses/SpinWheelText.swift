//
//  SpinWheelText.swift
//  WheelyCoolApp
//
//  Created by sonam taya on 16/2/22.
//

import UIKit


class SpinWheelText: UIView {
    var angles: [CGFloat] = []
    var wheelRadius: Float = 0.0
    var items = [SpinWheelItem]()
    func setAngles(_ angles: [CGFloat], withRadius wheelRadius: Float,items:[SpinWheelItem]) {
        self.angles = angles
        self.wheelRadius = wheelRadius
        self.items = items
        setNeedsDisplay()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = true
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        
        let size: CGSize = bounds.size
        context?.translateBy(x: size.width / 2, y: size.height / 2 )
        context?.scaleBy(x: 1, y: -1)
        let g = SpinWheelTextLayer()
        var i = 0
        g.lineLength = angles[0]
        for angle: CGFloat in angles {
            let a = Float(angle)
            
            g.centreArcPerpendicular(text: items[i].title ?? "", context: context!, radius: CGFloat(wheelRadius - 20), angle: CGFloat(a),colour:  UIColor.label, font: UIFont.systemFont(ofSize: 14), clockwise: false)

            i += 1
        }

    }
    
}
