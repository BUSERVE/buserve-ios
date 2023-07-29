//
//  MapSubSignTitle.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/29.
//

import UIKit

class MapSubSignTitle: UILabel {

    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setupTitle()
    }
    
    
    func setupTitle(){
        self.textColor = UIColor(red: 0.204, green: 0.227, blue: 0.251, alpha: 1)
        self.font = UIFont(name: "Pretendard-Regular", size: 16)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.36
        self.textAlignment = .center
        self.attributedText = NSMutableAttributedString(string: "현재 위치로 설정되어 있는 ___동에서만 위치\n인증을 할 수 있어요. 현재 위치를 확인해주세요.\n(위치인증을 한 곳에서만 예약이 가능합니다.)",
                                                        attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
    }

}
