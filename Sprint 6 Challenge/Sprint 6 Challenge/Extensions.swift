//
//  Extensions.swift
//  Sprint 6 Challenge
//
//  Created by Alex on 5/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

extension UIView {
    func makeCircle() {
        self.layer.cornerRadius = self.frame.size.height / 2;
        self.layer.masksToBounds = true;
    }
}
