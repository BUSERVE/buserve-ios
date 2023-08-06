//
//  BusDataTableView.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/08/05.
//

import UIKit

class BusDataTableView: UITableView {

    // MARK: - Properties
    
    var busData: [BusDataModel] = []
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        self.separatorStyle = .none
        
        self.register(BusTableViewCell.self, forCellReuseIdentifier: "BusCellId")
        self.isScrollEnabled = false
        self.delegate = self
        self.dataSource = self
    }
    
    convenience init(data: [BusDataModel]) {
        self.init(frame: .zero, style: .plain)
        self.busData = data
        self.sortBusData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - methods or layouts
    
    /// 즐겨찾은 버스를 상단으로 정렬해주는 함수
    private func sortBusData() {
        self.busData.sort { $0.isBookmark && !$1.isBookmark }
    }
}

    // MARK: - TableView Delegate

extension BusDataTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busData.count * 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 138
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BusCellId", for: indexPath) as! BusTableViewCell
            
            cell.selectionStyle = .none
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 16
            cell.layer.borderColor = UIColor.Tertiary.cgColor
            
            let index = indexPath.row / 2
            let data = busData[index]
            let routeMap = "\(data.Departure + " ↔ " + data.Arrival)"
            
            cell.busNum.text = "\(data.busNumber)"
            cell.routeMap.text = "\(routeMap)"
            
            cell.settingBookmarkButton(isBookmarked: data.isBookmark)
            
            /// 클로저를 사용하여 버튼이 눌렸을 때 수행하는 작업
            cell.onBookmarkButtonTap = { [weak self] in
                self?.busData[index].isBookmark.toggle()
                self?.reloadRows(at: [indexPath], with: .automatic)
            }
            return cell
            
        } else {
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            return cell
        }
        
    }
}
