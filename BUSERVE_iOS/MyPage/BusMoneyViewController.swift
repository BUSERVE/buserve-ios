//
//  BusMoneyViewController.swift
//  BUSERVE_iOS
//
//  Created by 정태우 on 2023/07/23.
//

import UIKit

class BusMoneyViewController: UIViewController {

    @IBOutlet weak var myBusMoneyView: UIView!
    @IBOutlet weak var myBusMoneyLabel: UILabel!
    @IBOutlet weak var chargeBusMoneyButton: UIButton!
    @IBOutlet weak var changePaymentMethodButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.configureView()
    }
    private func configureNavigationBar() {
        self.navigationItem.title = "버정머니 관리하기"
        navigationController?.navigationBar.tintColor = UIColor.Body
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func configureView() {
        navigationController?.navigationBar.tintColor = UIColor.Body
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        myBusMoneyView.layer.cornerRadius = 16.0
        myBusMoneyView.layer.borderColor = UIColor.MainColor?.cgColor
        myBusMoneyView.layer.borderWidth = 2.0
        chargeBusMoneyButton.layer.cornerRadius = 16.0
        changePaymentMethodButton.layer.cornerRadius = 16.0
    }
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
