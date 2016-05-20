//
//  ASDayV.swift
//  Example
//
//  Created by alberto.scampini on 19/05/2016.
//  Copyright © 2016 Alberto Scampini. All rights reserved.
//

import UIKit

class ASDayV : UIView {
    
    @IBOutlet var numberLabel : UILabel!
    @IBOutlet var selectionV : UIView!
    var viewModel : ASDayVM! {
        didSet {
            self.viewModel.dayM.bindAndFire {
                [unowned self] in
                self.hidden = !$0.dayEnabled
                if ($0.dayEnabled == true) {
                    self.numberLabel.text = String($0.dayNumber)
                    self.selectionV.hidden = !$0.daySelected
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap))
        self.addGestureRecognizer(tapGesture)
        self.userInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionV.layer.cornerRadius = self.selectionV.frame.size.height/2
    }
    
    //MARK: user interaction
    
    func handleTap () {
        self.viewModel.selected()
    }
    
}