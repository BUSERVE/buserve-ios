//
//  BusDataModel.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/07/31.
//

import Foundation

struct BusDataModel {
    let uid = UUID()
    let busNumber: String
    let Departure: String
    let Arrival: String
    var isBookmark: Bool
}


var busDataModel = [BusDataModel(busNumber: "9200", Departure: "송도파크레인동일하이빌", Arrival: "강남역서초현대타워앞", isBookmark: true),
                    BusDataModel(busNumber: "9802", Departure: "공단사거리", Arrival: "시민의숲.양재꽃시장", isBookmark: false),
                    BusDataModel(busNumber: "M6439", Departure: "인천터미널", Arrival: "역삼역.포스코타워역삼", isBookmark: false),
                    BusDataModel(busNumber: "9700", Departure: "대화역", Arrival: "양재역.서초문화예술회관(중)", isBookmark: true)]
