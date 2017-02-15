//
//  cumstomView.swift
//  t0039494
//
//  Created by O.E.Wilson on 15/02/2017.
//  Copyright © 2017 O.E.Wilson. All rights reserved.
//

import UIKit

class cumstomView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: SHADOW_GRAY).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize (width: 1.0, height: 1.0)
        layer.cornerRadius = 2.0
    }
}
