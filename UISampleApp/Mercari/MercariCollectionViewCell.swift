import UIKit

class MercariCollectionViewCell: UICollectionViewCell {
    let productImageView = UIImageView()
    let alphaView = UIView()
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(productImageView)
        contentView.addSubview(alphaView)
        contentView.addSubview(label)

        alphaView.backgroundColor = .gray
        alphaView.alpha = 0.8

        label.backgroundColor = .clear
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12.0)

        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        productImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        productImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        productImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        alphaView.translatesAutoresizingMaskIntoConstraints = false
        alphaView.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        alphaView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        alphaView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10.0).isActive = true
        alphaView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5.0).isActive = true

        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: alphaView.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: alphaView.leftAnchor, constant: 5.0).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setData(with product: Product) {
        productImageView.image = product.image
        label.text = product.title
    }

}
