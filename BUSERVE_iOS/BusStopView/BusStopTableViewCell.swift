//
//  BusStopTableViewCell.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/08/01.
//

import UIKit

class BusStopTableViewCell: UITableViewCell {

    var BusImage : UIImageView!
    var BusStopTitle : UILabel!
    var SubTitle : UILabel!
    var nextBtn : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCell()
        setImage()
        setTitle()
        setSub()
        setBtn()
    }

/*
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    
    }
  */
    
    func setCell(){
            self.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            self.layer.cornerRadius = 16
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor(red: 0.804, green: 0.827, blue: 0.851, alpha: 1).cgColor
    }
    
    
    func setImage(){
        BusImage = UIImageView()
        BusImage.image = UIImage(named: "Bigbus-stop.png")
        BusImage.contentMode = .scaleAspectFit
        
        BusImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        BusImage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        BusImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(BusImage)
        
        BusImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        BusImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
    }
    
    func setTitle(){
        BusStopTitle = UILabel()
        BusStopTitle.text = "공단사거리"
        BusStopTitle.textColor = UIColor(red: 0.204, green: 0.227, blue: 0.251, alpha: 1)
        BusStopTitle.font = UIFont(name: "Pretendard-SemiBold", size: 16)
        
        BusStopTitle.widthAnchor.constraint(greaterThanOrEqualToConstant: 70).isActive = true
        BusStopTitle.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(BusStopTitle)
        
        BusStopTitle.leadingAnchor.constraint(equalTo: self.BusImage.trailingAnchor, constant: 20).isActive = true
        BusStopTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
    }
    
    func setSub(){
        SubTitle = UILabel()
        SubTitle.text = "89070"
        SubTitle.textColor = UIColor(red: 0.525, green: 0.557, blue: 0.588, alpha: 1)
        SubTitle.font = UIFont(name: "Pretendard-SemiBold", size: 14)
        
        SubTitle.widthAnchor.constraint(greaterThanOrEqualToConstant: 44).isActive = true
        SubTitle.translatesAutoresizingMaskIntoConstraints = false
        addSubview(SubTitle)
        
        SubTitle.leadingAnchor.constraint(equalTo: self.BusImage.trailingAnchor, constant: 20).isActive = true
        SubTitle.topAnchor.constraint(equalTo: self.BusStopTitle.bottomAnchor, constant: 2).isActive = true
    }
    
    func setBtn(){
        nextBtn = UIButton()
        nextBtn.setImage(UIImage(named: "nextBtn.png"), for: .normal)
        nextBtn.tintColor = UIColor.black
        nextBtn.setTitle("하하", for: .normal)
        
        nextBtn.widthAnchor.constraint(equalToConstant: 26).isActive = true
        nextBtn.heightAnchor.constraint(equalToConstant: 26).isActive = true
        nextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        nextBtn.isUserInteractionEnabled = true
        nextBtn.addTarget(self, action: #selector(nextBtnClicked(_:)), for: .touchUpInside)
        
        addSubview(nextBtn)
      
        nextBtn.topAnchor.constraint(equalTo: self.topAnchor, constant: 25).isActive = true
        nextBtn.leadingAnchor.constraint(greaterThanOrEqualTo: self.BusStopTitle.trailingAnchor, constant: 149).isActive = true
        nextBtn.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func nextBtnClicked(_ sender: UIButton) {
        print("click")
    }
}
