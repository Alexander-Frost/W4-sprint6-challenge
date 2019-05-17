//
//  CustomControl.swift
//  Sprint 6 Challenge
//
//  Created by Alex on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
    
    var value: Double = 0.0
    
    var resetValue: CGFloat = 0.0
    var springBackValue: CGFloat = 80.0 // reset if drag >80% of the way - set initially to width
    
    func updateValue(at touch: UITouch){
        let touchPoint = touch.location(in: self)
        let xTouch = touchPoint.x / bounds.width
        value = Double(xTouch)
        sendActions(for: [.valueChanged])
        
//        // set to x range
//        let touchX = touch.x
//
//        if touchX < resetValue { // reset to origin
//            value = resetValue
//        } else if touchX > springBackValue { // move to end of frame
//            value = springBackValue
//        } else {
//            value = touchX
//        }
    }
    
    // MARK: - Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        sendActions(for: .touchDown)
//
//        let touchPoint = touch.location(in: self)
//        if bounds.contains(touchPoint) {
//            sendActions(for: [.touchDown])
//            updateValue(at: touch)
//        }
        
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint){
            updateValue(at: touch)
            sendActions(for: [.touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
            value = 0.0
        }
//
//        let touchPoint = touch.location(in: self)
//        if bounds.contains(touchPoint){
//            sendActions(for: [.touchDragInside])
//            updateValue(at: touch)
//        } else {
//            sendActions(for: [.touchDragOutside])
//            value = 0.0
//        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint){
            sendActions(for: [.touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
            value = 0.0
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
}
