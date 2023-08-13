//
//  HomeViewController.swift
//  BUSERVE_iOS
//
//  Created by ParkJunHyuk on 2023/08/04.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    private lazy var onBoardBusButton = OnBoardBusButtonView()
    private lazy var homeTitleLabel = HomeTitleLabelView()
    private lazy var busSerachTextField =  BusSerachTextField()
    private lazy var busTableView = BusDataTableView(data: busDataModel, isSortBookMark: false)

    private lazy var homeScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.frame = view.bounds
        scrollView.autoresizingMask = .flexibleHeight
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var homeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    private lazy var topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 77
        stackView.alignment = .fill

        stackView.addArrangedSubview(homeTitleLabel)
        stackView.addArrangedSubview(onBoardBusButton)
        
        homeTitleLabel.widthAnchor.constraint(equalToConstant: 196).isActive = true
        onBoardBusButton.widthAnchor.constraint(equalToConstant: 62).isActive = true
        
        return stackView
    }()
    
    private lazy var butTableTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "내 근처 버스"
        label.font = .headingBold
        label.textColor = .Body
        label.sizeToFit()
        return label
    }()
    
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
        
        onBoardBusButton.addTarget(self, action: #selector(getOnBusClicked), for: .touchUpInside)
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    // MARK: - methods or layouts
    
    private func addSubviews() {
        
        view.addSubview(homeScrollView)
        homeScrollView.addSubview(contentView)
        homeScrollView.addSubview(refreshControl)

        [topStackView, busSerachTextField, butTableTitleLabel, busTableView].forEach { contentView.addSubview($0) }
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        homeScrollView.translatesAutoresizingMaskIntoConstraints = false
        busSerachTextField.translatesAutoresizingMaskIntoConstraints = false
        butTableTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        busTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            homeScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            homeScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: homeScrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: homeScrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: homeScrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: homeScrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: homeScrollView.widthAnchor),


            topStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 48),
            topStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            topStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),


            busSerachTextField.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 32),
            busSerachTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            busSerachTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -27),


            butTableTitleLabel.topAnchor.constraint(equalTo: busSerachTextField.bottomAnchor, constant: 46),
            butTableTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            butTableTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),


            busTableView.topAnchor.constraint(equalTo: butTableTitleLabel.bottomAnchor, constant: 20),
            busTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            busTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            busTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            busTableView.heightAnchor.constraint(equalToConstant: CGFloat(busDataModel.count) * 160.0)
        ])
    }
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        busTableView.busData.sort { $0.isBookmark && !$1.isBookmark }
        busTableView.reloadData()
        
        // endRefreshing() 메서드를 호출하여 새로 고침 컨트롤을 종료합니다.
        refreshControl.endRefreshing()
    }
    
    @objc func getOnBusClicked(_ sender: UIButton) {
        print("탑승하기 버튼 Clicked")
    }
}
