//
//  ProductDetailViewController.swift
//  UISampleApp
//
//  Created by shindyu on 2017/12/31.
//  Copyright © 2017年 shindyu. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let likeCountLabel = UILabel()
    let dateLabel = UILabel()

    let product: Product

    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
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

    private func addSubviews() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(likeCountLabel)
        view.addSubview(dateLabel)
    }
    private func configureSubviews() {
        view.backgroundColor = .white

        imageView.image = product.image
        titleLabel.text = product.title
        likeCountLabel.text = "\(product.likeCount) 件"
        dateLabel.text = "\(product.date)"

    }
    private func setConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            ])

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])

        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            likeCountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            likeCountLabel.leftAnchor.constraint(equalTo: view.leftAnchor),
            likeCountLabel.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            dateLabel.leftAnchor.constraint(equalTo: likeCountLabel.rightAnchor),
            dateLabel.rightAnchor.constraint(equalTo: view.rightAnchor)
            ])
    }
}
