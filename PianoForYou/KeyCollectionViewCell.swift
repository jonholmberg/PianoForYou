//
//  KeyCollectionViewCell.swift
//  PianoForYou
//
//  Created by Jon Holmberg on 11/06/2018.
//  Copyright © 2018 Bent. All rights reserved.
//

import UIKit

class KeyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var textLabel: UILabel!
    
    public var text: String? {
        didSet {
            textLabel.text = text
        }
    }
}
