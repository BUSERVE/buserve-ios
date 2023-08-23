//
//  currentLocationSheetPop.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/08/23.
//

import UIKit

class currentLocationSheetPop: UIViewController {
    
    var current : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeConstrain()
        
    }
    
    
    private lazy var titleText : UILabel = {
        let title = UILabel()
        title.text = "현재 위치는 무슨무슨 동이에요"
        title.textColor = UIColor(red: 0.204, green: 0.227, blue: 0.251, alpha: 1)
        title.font = UIFont(name: "Pretendard-SemiBold", size: 18)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var inforText : UILabel = {
        let infor = UILabel()
        infor.font = UIFont(name: "Pretendard-Regular", size: 16)
        infor.numberOfLines = 0
        infor.textAlignment = .center
        infor.lineBreakMode = .byWordWrapping
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.36
        infor.attributedText = NSMutableAttributedString(string: "현재 위치로 설정되어 있는 ___동에서만 위치\n인증을 할 수 있어요. 현재 위치를 확인해주세요.\n(위치인증을 한 곳에서만 예약이 가능합니다.)", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        infor.translatesAutoresizingMaskIntoConstraints = false
        return infor
    }()
    
    private lazy var checkButton : UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 16
        btn.backgroundColor =  UIColor(red: 0.071, green: 0.408, blue: 0.984, alpha: 1)
        btn.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.setTitle("위치 인증하고 좌석 예약하기", for: .normal)
        btn.addTarget(self, action: #selector(clickOn), for: .touchUpInside)
        btn.addTarget(self, action: #selector(clickOut), for: .touchDown)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func makeConstrain(){
        [titleText, inforText, checkButton].forEach {self.view.addSubview($0)}
        
        titleText.widthAnchor.constraint(greaterThanOrEqualToConstant: 178).isActive = true
        
        inforText.widthAnchor.constraint(equalToConstant: 297).isActive = true
        inforText.heightAnchor.constraint(greaterThanOrEqualToConstant: 78).isActive = true
        
        checkButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        checkButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        NSLayoutConstraint.activate([
            titleText.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 42),
            titleText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            inforText.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 32),
            inforText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            checkButton.topAnchor.constraint(equalTo: inforText.bottomAnchor, constant: 42),
            checkButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc func clickOn(_sender : Any){
        checkButton.backgroundColor =  UIColor(red: 0.071, green: 0.408, blue: 0.984, alpha: 1)
        showPopUp(attributedMessage: "위치 인증이 완료되었습니다".toAttributedString(), leftActionTitle: "좌석 예약하기", leftActionCompletion: {
            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "BusStopViewController") as? BusStopViewController else {
                return
            }
            nextVC.modalTransitionStyle = .coverVertical
            nextVC.modalPresentationStyle = .fullScreen
            
            self.present(nextVC, animated: true, completion: nil)
        })
    }
    
    @objc func clickOut(_ sender : Any){
        checkButton.backgroundColor = UIColor.gray
        
    }

}
