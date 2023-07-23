//
//  SeatPayViewController.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/22.
//

import UIKit

class SeatPayViewController: UIViewController {
    
    /* Label IBOutlet */
    
    @IBOutlet var TitleLabel: [UILabel]! //Title Label array
    
    @IBOutlet weak var NumberImg: UIImageView! //bus number img
    @IBOutlet weak var BusStopImg: UIImageView! //bus stop img
    
    @IBOutlet weak var BusNumberTxt: UILabel! //BusNumber Text
    @IBOutlet weak var BusNameTxt: UILabel! //BusName Text
    
    @IBOutlet var DetailInformation: [UILabel]! //Detail Information Text
    @IBOutlet var DetailUnit: [UILabel]! //Detail Information Unit Text
    
    @IBOutlet var FirstMoneyInfor: [UILabel]! //top Money Information Text
    @IBOutlet var SecondMoneyInfor: [UILabel]!   //bottom Money Information Text
    
    @IBOutlet weak var BottomLabel: UILabel!
    
    /* View IBOutlet */
    
    @IBOutlet weak var BusNumberView: UIView!
    @IBOutlet weak var BusStopView: UIView!
    @IBOutlet weak var DetailView: UIView!
    @IBOutlet weak var MoneyView: UIView!
    
    /* Button */
    
    @IBOutlet weak var PayBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Title Label
        for i in TitleLabel{
            i.textColor = UIColor(red: 0.20, green: 0.23, blue: 0.25, alpha: 1.00)
            i.font = UIFont(name: "Pretendard-Bold", size: 20)
        }
        
        //BusImg
        NumberImg.image = UIImage(named: "white_bus.png")
        NumberImg.contentMode = .scaleAspectFit
        
        BusStopImg.image = UIImage(named: "black_bus.png")
        BusStopImg.contentMode = .scaleAspectFit
        
        
        //BusInformation Title
        BusNumberTxt.textColor = UIColor.white
        BusNameTxt.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        BusNameTxt.textColor = UIColor(red: 0.20, green: 0.23, blue: 0.25, alpha: 1.00)
        BusNameTxt.font = UIFont(name: "Pretendard-Bold", size: 18)
        
        //BusInforView
        BusNumberView.backgroundColor = UIColor(red: 0.07, green: 0.41, blue: 0.98, alpha: 1.00)
        BusNumberView.layer.cornerRadius = 8
        
        BusStopView.backgroundColor = UIColor.white
        BusStopView.layer.borderColor = UIColor(red: 0.80, green: 0.83, blue: 0.85, alpha: 1.00).cgColor
        BusStopView.layer.borderWidth = 1
        BusStopView.layer.cornerRadius = 8
        
        //Detail Information
        for i in DetailInformation{
            i.font = UIFont(name: "Pretendard-Bold", size: 18)
            i.textColor = UIColor(red: 0.20, green: 0.23, blue: 0.25, alpha: 1.00)
        }
        
        for i in DetailUnit{
            i.font = UIFont(name: "Pretendard-Regular", size: 18)
            i.textColor = UIColor(red: 0.20, green: 0.23, blue: 0.25, alpha: 1.00)
        }
        
        //Detail View
        DetailView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1.00).withAlphaComponent(0.75)
        DetailView.layer.cornerRadius = 16
        
        
        //Money Infor
        for i in FirstMoneyInfor{
            i.textColor = UIColor(red: 0.53, green: 0.56, blue: 0.59, alpha: 1.00)
            i.font = UIFont(name: "Pretendard-Regular", size: 16)
        }
        
        for i in SecondMoneyInfor{
            i.textColor = UIColor(red: 0.20, green: 0.23, blue: 0.25, alpha: 1.00)
            i.font = UIFont(name: "Pretendard-BOld", size: 18)
        }
        
        //Money View
        MoneyView.layer.borderColor = UIColor(red: 0.91, green: 0.93, blue: 0.94, alpha: 1.00).cgColor
        MoneyView.layer.borderWidth = 1
        MoneyView.layer.cornerRadius = 16

        //Bottom Btn
        PayBtn.backgroundColor = UIColor(red: 0.07, green: 0.41, blue: 0.98, alpha: 1.00)
        PayBtn.setTitleColor(.white, for: .normal)
        PayBtn.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 16)
        PayBtn.layer.cornerRadius = 16
        
        //BottomLabel
        BottomLabel.textColor = UIColor(red: 0.53, green: 0.56, blue: 0.59, alpha: 1.00)
        BottomLabel.font = UIFont(name: "Pretendard-Regular", size: 14)
    }
    
    @IBAction func payClick(_ sender: Any) {
        self.performSegue(withIdentifier: "seatReservationComplete", sender: self)
    }
    
    
}
