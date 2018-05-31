//
//  TopViewController.swift
//  UISampleApp
//
//  Created by shindyu on 2018/05/31.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import UIKit

class TabbarSampleViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstVC = UINavigationController.init(rootViewController: FirstViewController())
        firstVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)

        let secondVC = UINavigationController.init(rootViewController: SecondViewController())
        secondVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)

        setViewControllers([firstVC, secondVC], animated: false)
    }
}
