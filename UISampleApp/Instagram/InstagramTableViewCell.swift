import UIKit

class InstagramTableViewCell: UITableViewCell {
    let userInfoView = UIView()
    let userIcon = UIImageView()
    let userNameLabel = UILabel()
    let productImageView = UIImageView()
    let descriptionView = UIView()
    let likeButton = UIButton()
    let titleLabel = UILabel()
    let likeCountLabel = UILabel()
    let dateLabel = UILabel()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
        configureSubviews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setData(with product: Product) {
        userIcon.image = product.userInfo.icon
        userNameLabel.text = product.userInfo.name
        titleLabel.text = product.title
        productImageView.image = product.image
        likeCountLabel.text = "\(product.likeCount) 件"
        dateLabel.text = "\(product.date)"
    }

    private func addSubviews() {
        contentView.addSubview(userInfoView)
        userInfoView.addSubview(userIcon)
        userInfoView.addSubview(userNameLabel)
        contentView.addSubview(productImageView)
        contentView.addSubview(descriptionView)
        descriptionView.addSubview(likeButton)
        descriptionView.addSubview(likeCountLabel)
        descriptionView.addSubview(dateLabel)
        descriptionView.addSubview(titleLabel)
    }

    private func configureSubviews() {
        userIcon.layer.cornerRadius = 15.0
        userIcon.clipsToBounds = true
        userIcon.layer.borderWidth = 0.5
        userIcon.layer.borderColor = UIColor.lightGray.cgColor

        productImageView.contentMode = .scaleAspectFit

        descriptionView.backgroundColor = .white
        descriptionView.alpha = 0.8

        likeButton.setImage(#imageLiteral(resourceName: "like-off"), for: .normal)
        likeButton.setImage(#imageLiteral(resourceName: "like-on"), for: .selected)
        likeButton.addTarget(self, action: #selector(tapLikeButton), for: .touchUpInside)

        dateLabel.textColor = .lightGray
        dateLabel.font = UIFont.systemFont(ofSize: 12.0)
    }

    private func setConstraints() {
        userInfoView.translatesAutoresizingMaskIntoConstraints = false
        userInfoView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        userInfoView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        userInfoView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        userInfoView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        userIcon.translatesAutoresizingMaskIntoConstraints = false
        userIcon.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        userIcon.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        userIcon.centerYAnchor.constraint(equalTo: userInfoView.centerYAnchor).isActive = true
        userIcon.leftAnchor.constraint(equalTo: userInfoView.leftAnchor, constant: 10.0).isActive = true

        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.centerYAnchor.constraint(equalTo: userInfoView.centerYAnchor).isActive = true
        userNameLabel.leftAnchor.constraint(equalTo: userIcon.rightAnchor, constant: 10.0).isActive = true

        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.widthAnchor.constraint(lessThanOrEqualToConstant: UIScreen.main.bounds.width).isActive = true
        productImageView.heightAnchor.constraint(lessThanOrEqualTo: productImageView.widthAnchor, multiplier: 2/3).isActive = true
        productImageView.topAnchor.constraint(equalTo: userInfoView.bottomAnchor).isActive = true
        productImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        productImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.topAnchor.constraint(equalTo: productImageView.bottomAnchor).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true

        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
        likeButton.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        likeButton.topAnchor.constraint(equalTo: descriptionView.topAnchor, constant: 10.0).isActive = true
        likeButton.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10.0).isActive = true

        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        likeCountLabel.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 10.0).isActive = true

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: likeButton.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: likeCountLabel.rightAnchor, constant: 10.0).isActive = true

        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 5.0).isActive = true
        dateLabel.leftAnchor.constraint(equalTo: descriptionView.leftAnchor, constant: 10.0).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: -5.0).isActive = true
    }

    @objc private func tapLikeButton() {
        likeButton.isSelected = !likeButton.isSelected
    }
}
