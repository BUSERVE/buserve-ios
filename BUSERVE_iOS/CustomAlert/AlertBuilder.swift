//
//  AlertBuilder.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/08/10.
//

import Foundation
import UIKit

struct AddAction{
    var text: String?
    var action: (() -> Void)?
}

class AlertBuilder{
    private let baseViewController: UIViewController
    private let alertViewController = CustomAlert()
    
    private var message: String?
    private var addActionConfirm: AddAction?
    
    init(viewController: UIViewController){
        baseViewController = viewController
    }
    
    func setMessage(_ text: String) -> AlertBuilder{
        message = text
        return self
    }
    
    func addAction(_ text: String, action: (() -> Void)? = nil) -> AlertBuilder{
        addActionConfirm = AddAction(text: text, action: action)
        return self
    }
    
    @discardableResult
    func show() -> Self{
        
    }
}
