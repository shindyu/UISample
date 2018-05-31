//
//  FirstViewController.swift
//  UISampleApp
//
//  Created by shindyu on 2018/05/31.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    let searchBar = UISearchBar()
    let button = UIButton(type: .system)

    init() {
        super.init(nibName: nil, bundle: nil)

        title = "FirstViewController"
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
        view.addSubview(searchBar)
        view.addSubview(button)
    }

    fileprivate func configureSubviews() {
        view.backgroundColor = .red

        searchBar.placeholder = "search"

        button.setTitle("button", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    fileprivate func setConstraints() {
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBar.leftAnchor.constraint(equalTo: view.leftAnchor),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor),
            searchBar.heightAnchor.constraint(equalToConstant: 44.0)
            ])
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }

    @objc fileprivate func didTapButton() {
        let vc = PresentViewController()
        present(vc, animated: true, completion: nil)
    }
}
