//
//  MapMainSignTitle.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/29.
//

import UIKit

class MapMainSignTitle: UILabel {

    override init(frame: CGRect){
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTitle()
    }
    
    func setupTitle(){
        self.text = "현재 위치는 _동이에요"
        self.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        self.textColor = UIColor(red: 0.204, green: 0.227, blue: 0.251, alpha: 1)
    }
    

}
