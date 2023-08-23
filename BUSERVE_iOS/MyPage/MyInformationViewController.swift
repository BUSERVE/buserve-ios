//
//  MyInformationVIewController.swift
//  BUSERVE_iOS
//
//  Created by 정태우 on 2023/07/23.
//

import UIKit

class MyInformationViewController: UIViewController {
    
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var accountDeletionButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var signUpMethodLabel: UILabel!
    @IBOutlet weak var signUpMethodImageView: UIImageView!
    
    private var userInfoManager = UserInfoManager(loadUseCase: LoadUserInfoUseCase())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.configureView()
        
        Task {
            guard let userInfo = try await userInfoManager.loadUserInfo() else {
                return
            }
            await updateUI(with: userInfo)
        }
    }
    
    func updateUI(with user: UserInfo) async {
        await MainActor.run {
            self.nameLabel.text = user.name
            self.mailLabel.text = user.email
        }
    }
    
    private func configureNavigationBar() {
        self.navigationItem.title = "내 정보 관리"
        navigationController?.navigationBar.tintColor = UIColor.Body
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func configureView() {
        navigationController?.navigationBar.tintColor = UIColor.Body
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.logOutButton.layer.cornerRadius = 16.0
        self.accountDeletionButton.layer.cornerRadius = 16.0
        self.accountDeletionButton.layer.borderColor = UIColor.Quaternary?.cgColor
        self.accountDeletionButton.layer.borderWidth = 1.0
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapLogOutButton(_ sender: UIButton) {
        guard let logOutViewController = self.storyboard?.instantiateViewController(withIdentifier: "LogOutViewController") as? LogOutViewController else { return }
        self.navigationController?.pushViewController(logOutViewController, animated: true)
    }
    
    @IBAction func tapWithdrawButton(_ sender: Any) {
        guard let withdrawViewController = self.storyboard?.instantiateViewController(withIdentifier: "WithdrawViewController") as? WithdrawViewController else { return }
        self.navigationController?.pushViewController(withdrawViewController, animated: true)
    }
    
}
