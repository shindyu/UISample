//
//  PresentViewController.swift
//  UISampleApp
//
//  Created by shindyu on 2018/05/31.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import UIKit

class PresentViewController: UIViewController {
    let button = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        view.addSubview(button)

        button.setTitle("close", for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }

    @objc fileprivate func close() {
        dismiss(animated: true, completion: nil)
    }
}
