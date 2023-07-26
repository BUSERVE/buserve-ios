//
//  LoginViewController.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/07/26.
//

import UIKit

class LoginViewController: UIViewController {

    private var kakaoLoginButton = SocialLoginButtonView(type: .kakao)
    private var googleLoginButton = SocialLoginButtonView(type: .google)
    private var appleLoginButton = SocialLoginButtonView(type: .apple)
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .Body
        label.font = .LoginTitle
        label.translatesAutoresizingMaskIntoConstraints = false

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 10
        
        let attributedText = NSMutableAttributedString(string: "반가워요!\n오늘부터 출퇴근길\nBUSERVE와 함께해요!")
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedText.length))

        let rangeBUSERVE = (attributedText.string as NSString).range(of: "BUSERVE")
        let attributesBUSERVE: [NSAttributedString.Key: UIColor] = [
            .foregroundColor: .MainColor
        ]

        attributedText.addAttributes(attributesBUSERVE, range: rangeBUSERVE)
        label.attributedText = attributedText
        label.sizeToFit()
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        [titleLabel, kakaoLoginButton, googleLoginButton, appleLoginButton].forEach { view.addSubview($0) }
        
        kakaoLoginButton.translatesAutoresizingMaskIntoConstraints = false
        googleLoginButton.translatesAutoresizingMaskIntoConstraints = false
        appleLoginButton.translatesAutoresizingMaskIntoConstraints = false

        configureConstraints()
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            titleLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -78),
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 238),
            
            
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 46),
            kakaoLoginButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            kakaoLoginButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            kakaoLoginButton.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.bottomAnchor, constant: 172),


            googleLoginButton.heightAnchor.constraint(equalToConstant: 46),
            googleLoginButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            googleLoginButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            googleLoginButton.safeAreaLayoutGuide.topAnchor.constraint(equalTo: kakaoLoginButton.safeAreaLayoutGuide.bottomAnchor, constant: 12),


            appleLoginButton.heightAnchor.constraint(equalToConstant: 46),
            appleLoginButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            appleLoginButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            appleLoginButton.topAnchor.constraint(equalTo: googleLoginButton.safeAreaLayoutGuide.bottomAnchor, constant: 12),
            appleLoginButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
        ])
    }
}
