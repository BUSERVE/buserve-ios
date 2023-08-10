//
//  ViewController.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/19.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
    }
    
    @IBAction func tapv(_ sender: Any) {
        showPopUp(attributedMessage: "버스 좌석을 예약하시려면 \n 노쇼 방지를 위해서 \n 위치 인증이 필요해요.".toAttributedString(), leftActionTitle: "sss", rightActionTitle: "위치 인증하기")
    }
}

