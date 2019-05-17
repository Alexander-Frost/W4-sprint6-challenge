//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Alex on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: CGFloat = 0.0
    var resetValue: CGFloat = 0.0
    var springBackValue: CGFloat = 80.0 // reset if drag >80% of the way
    
    func updateValue(at touch: UITouch){
        let touchPoint = touch.location(in: self)
        // set to x range
        let touchX = touchPoint.x / bounds.width
        value = touchX
    }
    
    // MARK: - Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDown, .valueChanged])
            updateValue(at: touch)
        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint){
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside, .valueChanged])
            value = 0.0
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside, .valueChanged])
            value = 0.0
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
}
