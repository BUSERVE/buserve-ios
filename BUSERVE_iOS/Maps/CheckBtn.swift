//
//  CheckBtn.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/29.
//

import UIKit

class CheckBtn: UIButton {
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBtn()
    }
   
    func setupBtn(){
        self.layer.cornerRadius = 16
        self.backgroundColor = UIColor(red: 0.07, green: 0.41, blue: 0.98, alpha: 1.00)
        self.setTitle("위치 인증하고 좌석 예약하기", for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        self.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
    }
    
    func completeCertification(){
        
    }
}
