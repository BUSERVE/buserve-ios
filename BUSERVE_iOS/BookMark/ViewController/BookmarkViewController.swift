//
//  BookmarkViewController.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/07/31.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    lazy var busDataListView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none // cell line 없애기
        tableView.register(BusDataTableViewCell.self, forCellReuseIdentifier: "BusCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        
        busDataListView.delegate = self
        busDataListView.dataSource = self
        busDataListView.delaysContentTouches = false
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        [busDataListView].forEach { view.addSubview($0) }
        busDataListView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            busDataListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            busDataListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            busDataListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            busDataListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension BookmarkViewController: ButtonTappedDelegate {
    func cellButtonTapped(index: Int?) {
        guard let index = index else {
            return
        }
        print("\(busDataModel[index])")
        
        busDataModel[index].isBookmark.toggle()

        print("\(busDataModel[index])")
        
        busDataListView.reloadData()
    }
}

//  TableView 는 Cell 간격을 둘 수 없어 짝수번째의 Cell 에 데이터를 입력, 홀수번째는 빈 Cell 로 간격을 설정
extension BookmarkViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return busDataModel.count * 2
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "BusCell", for: indexPath) as! BusDataTableViewCell

            let index = indexPath.row / 2
            
            cell.index = index // Cell 의 Button 을 눌렀을 때 몇번째 Cell 인지 파악하기 위해 사용
            
            cell.delegate = self

            cell.selectionStyle = .none
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 16

            let color: UIColor = .Tertiary
            cell.layer.borderColor = color.cgColor
            
            let busData = busDataModel[index]
            let routeMap = "\(busData.Departure + " ↔ " + busData.Arrival)"
            
            cell.busNum.text = "\(busData.busNumber)"
            cell.routeMap.text = "\(routeMap)"
            
            if busData.isBookmark == true {
                cell.bookmarkButton.configuration = UIButton.Configuration.bookmarkButtonStyle(style: .bookmarked)
            } else {
                cell.bookmarkButton.configuration = UIButton.Configuration.bookmarkButtonStyle(style: .notBookmarked)
            }
        
            return cell
                
        } else {
            
            return UITableViewCell()
        }
    }
}
