import UIKit

let dummyProducts: [Product] = [
    Product(
        title: "product title 1", image: #imageLiteral(resourceName: "cosme1"), likeCount: 11, date: Date(),
        userInfo: UserInfo(name: "user name", icon: #imageLiteral(resourceName: "Icon"))
    ),
    Product(
        title: "product title 2", image: #imageLiteral(resourceName: "cosme2"), likeCount: 21, date: Date(),
        userInfo: UserInfo(name: "user name", icon: #imageLiteral(resourceName: "Icon"))
    ),
    Product(
        title: "product title 3", image: #imageLiteral(resourceName: "cosme3"), likeCount: 31, date: Date(),
        userInfo: UserInfo(name: "user name", icon: #imageLiteral(resourceName: "Icon"))
    ),
]

struct Product {
    let title: String
    let image: UIImage
    let likeCount: Int
    let date: Date
    let userInfo: UserInfo
}

struct UserInfo {
    let name: String
    let icon: UIImage
}
