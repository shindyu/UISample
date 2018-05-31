import UIKit

protocol Router {
    func pushToProductDetailVC(product: Product)
}

struct DefaultRouter: Router {
    let navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    func pushToProductDetailVC(product: Product) {
        let vc = ProductDetailViewController(product: product)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
