//
//  SecondViewController.swift
//  UISampleApp
//
//  Created by shindyu on 2018/05/31.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    let searchController = UISearchController(searchResultsController: nil)
    let tableView = UITableView()

    let dataList = [
        "row1",  "row2",  "row3",  "row4",  "row5",
        "row6",  "row7",  "row8",  "row9",  "row10",
        "row11", "row12", "row13", "row14", "row15",
        "row16", "row17", "row18", "row19", "row20",
        "row21", "row22", "row23", "row24", "row25",
        "row26", "row27", "row28", "row29", "row30"
    ]
    var filteredDataList = [String]()

    init() {
        super.init(nibName: nil, bundle: nil)

        title = "SecondViewController"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        configureSubviews()
        setConstraints()
    }

    fileprivate func addSubviews() {
        view.addSubview(tableView)
    }

    fileprivate func configureSubviews() {
        view.backgroundColor = .white

        navigationItem.title = "second"
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        tableView.dataSource = self
    }

    fileprivate func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}

extension SecondViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let text = searchController.searchBar.text ?? ""
        if text.isEmpty {
            filteredDataList = dataList
        } else {
            filteredDataList = dataList.filter { $0.contains(text) }
        }
        tableView.reloadData()
    }
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredDataList.count
        } else {
            return dataList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if searchController.isActive {
            cell.textLabel?.text = filteredDataList[indexPath.row]
        } else {
            cell.textLabel?.text = dataList[indexPath.row]
        }
        return cell
    }
}
