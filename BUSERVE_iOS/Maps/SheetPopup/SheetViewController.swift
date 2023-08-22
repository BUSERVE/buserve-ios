//
//  SheetViewController.swift

//
//  Created by 정의찬 on 2023/08/20.
//

import UIKit

class SheetViewController: UIViewController {
    
    private var sheetUIView : SheetView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    private func setView(){
        sheetUIView = SheetView()
        self.view.addSubview(sheetUIView)
        
        sheetUIView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sheetUIView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            sheetUIView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            sheetUIView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            sheetUIView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
        ])
        
      
    }
    
}
