import UIKit

class MercariViewController: UIViewController {
    let collectionView: UICollectionView!
    let router: Router
    let dummy: [Product]

    init(router: Router) {
        self.router = router
        self.dummy = dummyProducts
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        let cellsize = UIScreen.main.bounds.width / 3 - 10
        collectionViewLayout.itemSize = CGSize(width: cellsize, height: cellsize)
        collectionViewLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        collectionViewLayout.minimumLineSpacing = 10
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        collectionView.indexPathsForSelectedItems?.forEach {
            collectionView.deselectItem(at: $0, animated: true)
        }
        collectionView.flashScrollIndicators()
    }


    private func addSubviews() {
        view.addSubview(collectionView)
    }

    private func configureSubviews() {
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(MercariCollectionViewCell.self, forCellWithReuseIdentifier: MercariCollectionViewCell.description())
        collectionView.backgroundColor = .white
        collectionView.isUserInteractionEnabled = true
    }

    private func setConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}

extension MercariViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        router.pushToProductDetailVC(product: dummy[indexPath.row % 3])
    }
}

extension MercariViewController: UICollectionViewDataSource {
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
