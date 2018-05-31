//
//  SelectTableViewController.swift
//  UISampleApp
//
//  Created by shindyu on 2017/12/28.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import UIKit

enum SampleType: Int, EnumCollection {
    case instagram
    case mercari
    case pinterest
    case collectionView
    case tabbarSample

    var title: String {
        switch self {
        case .instagram:
            return "instagram"
        case .mercari:
            return "mercari"
        case .pinterest:
            return "pinterest"
        case .collectionView:
            return "collectionView"
        case .tabbarSample:
            return "tabbarSample"
        }
    }
}

class SelectTableViewController: UIViewController {
    let tableView: UITableView!

    init() {
        tableView = UITableView()

        super.init(nibName: nil, bundle: nil)

        tableView.delegate = self
        tableView.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let indexPathForSelectedRow = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPathForSelectedRow, animated: true)
        }
        tableView.flashScrollIndicators()
    }
}

extension SelectTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc: UIViewController
        let router = DefaultRouter(navigationController: self.navigationController)

        switch SampleType(rawValue: indexPath.row)! {
        case .instagram:
            vc = InstagramViewController(router: router)
        case .mercari:
            vc = MercariViewController(router: router)
        case .pinterest:
            vc = PinterestViewController(router: router)
        case .collectionView:
            vc = CollectionViewController(router: router)
        case .tabbarSample:
            vc = TabbarSampleViewController()
            present(vc, animated: true, completion: nil)
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension SelectTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SampleType.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = SampleType(rawValue: indexPath.row)?.title
        return cell
    }
}
