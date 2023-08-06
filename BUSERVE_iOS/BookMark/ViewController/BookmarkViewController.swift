//
//  BookmarkViewController.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/07/31.
//

import UIKit

class BookmarkViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var busDataListView = BusDataTableView(data: busDataModel, isSortBookMark: true)
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor.MainColor
        return refreshControl
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
        
        busDataListView.refreshControl = refreshControl

        view.backgroundColor = .white
    }
    
    // MARK: - methods or layouts
    
    private func addSubviews() {
        [busDataListView].forEach { view.addSubview($0) }
        busDataListView.addSubview(refreshControl)
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
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.busDataListView.busData = self.busDataListView.busData.filter{ $0.isBookmark == true }
            self.busDataListView.reloadData()
            self.busDataListView.refreshControl?.endRefreshing()
        }
    }
}
