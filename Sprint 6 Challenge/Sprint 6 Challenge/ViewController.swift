//
//  ViewController.swift
//  Sprint 6 Challenge
//
//  Created by Spencer Curtis on 8/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var fullView: UIView!
    @IBOutlet var resetBtn: UIBarButtonItem!
    @IBOutlet var lockImgView: UIImageView!
    @IBOutlet var sliderView: UIView!
    @IBOutlet var sliderViewContainer: UIView!
    @IBOutlet var sliderViewConstraint: NSLayoutConstraint!
    
    // MARK: - Actions
    @IBAction func resetBtnPressed(_ sender: UIBarButtonItem) {
        sliderReset()
        sliderViewContainer.isUserInteractionEnabled = true
    }
    
    @IBAction func swipeDrag(_ sender: CustomControl){
        // set value to width of container
        sender.springBackValue = sliderViewContainer.frame.width - sliderView.frame.width
        // set constraint of slider
        sliderViewConstraint.constant = sender.value - (sliderView.frame.width / 2)
        
        // unlock if >80%
        if sender.value >= (sliderViewContainer.frame.width * 0.8 - sliderView.frame.width) {
            sliderUnlocked()
            sliderViewContainer.isUserInteractionEnabled = false
        } else if sender.value != 0.0, sender.value <= sliderViewContainer.frame.width {
            sliderReset()
        }
    }
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup(){
        resetBtn.tintColor = .clear
        resetBtn.isEnabled = false
        lockImgView.image = UIImage(named: "Locked")
        sliderView.makeCircle()
        sliderView.backgroundColor = .green
        sliderViewContainer.layer.cornerRadius = 10
        sliderViewContainer.layer.masksToBounds = true
        fullView.layer.cornerRadius = 10
        fullView.layer.masksToBounds = true
    }
    
    // move to begining of slider view
    func sliderReset(){
        UIView.animate(withDuration: 1.0, animations: {
            self.lockImgView.image = UIImage(named: "Locked")
            self.resetBtn.tintColor = .clear
            self.resetBtn.isEnabled = false
            self.sliderViewConstraint.constant = 8
            self.view.layoutIfNeeded()
        })
    }
    
    func sliderUnlocked(){
        UIView.animate(withDuration: 1.0, animations: {
            self.lockImgView.image = UIImage(named: "Unlocked")
            self.resetBtn.tintColor = .red
            self.resetBtn.isEnabled = true
            self.sliderViewConstraint.constant = self.sliderViewContainer.frame.width
            self.view.layoutIfNeeded()
        })
    }
}

