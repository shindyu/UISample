//
//  CollectionViewController.swift
//  UISampleApp
//
//  Created by shindyu on 2018/04/14.
//  Copyright © 2018年 shindyu. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {
    var collectionView: UICollectionView!
    let router: Router
    let dummy: [Product]

    init(router: Router) {
        self.router = router
        self.dummy = dummyProducts
        
        super.init(nibName: nil, bundle: nil)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.size.width / 2 - 10, height: 50)
        collectionView = UICollectionView(frame: CGRect.init(origin: .zero, size: UIScreen.main.bounds.size), collectionViewLayout: layout)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(MercariCollectionViewCell.self, forCellWithReuseIdentifier: MercariCollectionViewCell.description())

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        collectionView.indexPathsForSelectedItems?.forEach {
            collectionView.deselectItem(at: $0, animated: true)
        }
        collectionView.flashScrollIndicators()
    }

}


extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router.pushToProductDetailVC(product: dummy[indexPath.row % 3])
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MercariCollectionViewCell.description(), for: indexPath) as? MercariCollectionViewCell {
            let random = Int(arc4random_uniform(3))
            cell.setData(with: dummy[random])
            return cell
        }
        return UICollectionViewCell()
    }

}
