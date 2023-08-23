//
//  SheetViewController.swift

//
//  Created by 정의찬 on 2023/08/20.
//

import UIKit
import NMapsMap

class SheetViewController: UIViewController {
    
    private var sheetUIView : SheetView!
    private var reserve : ReserveBusMarker?

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private lazy var checkBtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("길찾기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        btn.backgroundColor = UIColor(red: 0.071, green: 0.408, blue: 0.984, alpha: 1)
        btn.layer.cornerRadius = 16
   //
        btn.addTarget(self, action: #selector(sendData), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private func setView(){
        sheetUIView = SheetView()
        
        self.view.addSubview(sheetUIView)
        self.view.addSubview(checkBtn)
        checkBtn.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        sheetUIView.translatesAutoresizingMaskIntoConstraints = false
        sheetUIView.heightAnchor.constraint(equalToConstant: 270).isActive = true
        
        NSLayoutConstraint.activate([
            sheetUIView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            sheetUIView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            sheetUIView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            
            checkBtn.topAnchor.constraint(equalTo: sheetUIView.bottomAnchor, constant: 20),
            checkBtn.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            checkBtn.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
        
    }
    
}
