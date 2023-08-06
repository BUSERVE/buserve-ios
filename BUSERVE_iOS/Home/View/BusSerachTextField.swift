//
//  BusSerachTextField.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/08/04.
//

import UIKit

class BusSerachTextField: UITextField {

    // MARK: - Properties
    
    var textPadding = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 10)
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.placeholder = "예약하려는 버스를 검색해주세요."
        self.textColor = .Secondary
        
        if let image = UIImage(systemName: "magnifyingglass") {
            setRightViewWith(image: image, width: 22, height: 22, paddingRight: 20)
        }

        self.clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        borderStyle = .none
        layer.cornerRadius = bounds.height / 2
        layer.borderWidth = 2.5
        layer.borderColor = UIColor.MainColor.cgColor
        layer.shadowColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4.0)
        layer.shadowRadius = 8
        layer.masksToBounds = false
        layer.shadowOpacity = 0.6

        layer.backgroundColor = UIColor.white.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - methods or layouts
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    func setRightViewWith(image: UIImage, width: CGFloat, height: CGFloat, paddingRight: CGFloat) {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageView.image = image.withTintColor(.Body, renderingMode: .alwaysOriginal)
        imageView.contentMode = .scaleAspectFit

        let view = UIView(frame: CGRect(x: 0, y: 0, width: width + paddingRight, height: height))
        view.addSubview(imageView)
        
        self.rightView = view
        self.rightViewMode = .always
    }
}
