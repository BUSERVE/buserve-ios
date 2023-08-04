//
//  ChargeCompleteViewController.swift
//  BUSERVE_iOS
//
//  Created by 정태우 on 2023/08/04.
//

import UIKit

class ChargeCompleteViewController: UIViewController {

    @IBOutlet weak var completeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    private func configureView() {
        self.completeButton.layer.cornerRadius = 16.0
    }
    
    @IBAction func tapCompleteButton(_ sender: UIButton) {
    }
    
}
