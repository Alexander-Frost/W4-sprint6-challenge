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
    @IBOutlet weak var customControl: CustomControl!

    
    // MARK: - Actions
    @IBAction func resetBtnPressed(_ sender: UIBarButtonItem) {
        sliderReset()
        sliderViewContainer.isUserInteractionEnabled = true
    }
    
    @IBAction func swipeDrag(_ sender: CustomControl){
        print(sender.value)
        sliderViewConstraint.constant = CGFloat(sender.value * 300)
        if sender.value > 0.80 {
            sliderUnlocked()
            sender.value = Double(customControl.bounds.width)
            customControl.isEnabled = false
        }
//        else { //if sender.value < 0.80 {
//            sliderReset()
////            UIView.animate(withDuration: 1.0) {
////                self.sliderViewConstraint.constant = 0
////            }
//        }
        
        
        
        
        
//        // set value to width of container
//        sender.springBackValue = sliderViewContainer.frame.width - sliderView.frame.width
//        // set constraint of slider
//        sliderViewConstraint.constant = sender.value - (sliderView.frame.width / 2)
//
//        // unlock if >80%
//        if sender.value >= (sliderViewContainer.frame.width * 0.8){ //- sliderView.frame.width) {
//            sliderUnlocked()
//            sender.value = sliderViewContainer.frame.width
//            sliderViewContainer.isUserInteractionEnabled = false
//            sliderView.isUserInteractionEnabled = false
//        } else if sender.value < (sliderViewContainer.frame.width * 0.01) { //sender.value != 0.0
//            print("RESET")
//            sliderReset()
//        }
    }
    
    // MARK: - VC Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
//        sliderViewConstraint.constant = 0
    }

    func setup(){
        resetBtn.tintColor = .clear
        resetBtn.isEnabled = false
        lockImgView.image = UIImage(named: "Locked")
        sliderView.makeCircle()
        sliderView.backgroundColor = .green
        sliderViewContainer.backgroundColor = .gray
        sliderViewContainer.layer.cornerRadius = 10
        sliderViewContainer.layer.masksToBounds = true
        fullView.layer.cornerRadius = 10
        fullView.layer.masksToBounds = true
        sliderView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // move to begining of slider view
    func sliderReset(){
        UIView.animate(withDuration: 1.0, animations: {
            self.lockImgView.image = UIImage(named: "Locked")
            self.resetBtn.tintColor = .clear
            self.customControl.isEnabled = true
            self.resetBtn.isEnabled = false
            self.view.backgroundColor = .white
            self.resetBtn.tintColor = .white
            self.sliderViewConstraint.constant = 0
            self.view.layoutIfNeeded()
        })
    }
    
    func sliderUnlocked(){
        UIView.animate(withDuration: 1.0, animations: {
            self.lockImgView.image = UIImage(named: "Unlocked")
            self.view.backgroundColor = .orange
            self.resetBtn.tintColor = .white
            self.resetBtn.isEnabled = true
            self.view.layoutIfNeeded()

        })
    }
}

