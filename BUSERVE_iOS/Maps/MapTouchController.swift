//
//  MapTouchController.swift
//  BUSERVE_iOS
//
//  Created by 정의찬 on 2023/07/25.
//

import UIKit
import NMapsMap

class MapTouchController: MapsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.touchDelegate = self
    }
}
    

extension MapTouchController: NMFMapViewTouchDelegate{
    func mapView(_ mapView: NMFMapView, didTapMap latlng: NMGLatLng, point: CGPoint) {
        print("지도 탭")
    }

    func mapView(_ mapView: NMFMapView, didTap symbol: NMFSymbol) -> Bool {
        if symbol.caption == "서울특별시청" {
            print("서울시청 탭")
            return true

        } else {
            print("symbol 탭")
            return false
        }
    }
}
