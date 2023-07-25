//
//  MapsViewController.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/24.
//

import UIKit
import NMapsMap

class MapsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let NmapView = NMFMapView(frame:  view.frame)
        self.view.addSubview(NmapView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
