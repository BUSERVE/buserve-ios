//
//  MapCheckControll.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/29.
//

import UIKit

class MapCheckControll: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(){
        self.clipsToBounds = true
        self.layer.cornerRadius = 16
        self.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: -4)
    }
    
}
