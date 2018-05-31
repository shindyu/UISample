import UIKit

class InstagramViewController: UIViewController {
    var tableView = UITableView()

    let router: Router
    let dummy: [Product]

    init(router: Router) {
        self.router = router
        self.dummy = dummyProducts

        super.init(nibName: nil, bundle: nil)

        tableView.delegate = self
        tableView.dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(tableView)

        tableView.register(InstagramTableViewCell.self, forCellReuseIdentifier: InstagramTableViewCell.description())
        tableView.backgroundColor = .white
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorColor = .clear

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

extension InstagramViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router.pushToProductDetailVC(product: dummy[indexPath.row % 3])
    }
}

extension InstagramViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummy.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: InstagramTableViewCell.description(), for: indexPath) as? InstagramTableViewCell {
            cell.setData(with: dummy[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
}
