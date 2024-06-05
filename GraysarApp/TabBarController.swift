//
//  TabBarController.swift
//  GraysarApp
//
//  Created by Madina Olzhabek on 04.06.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    var mainVC = UINavigationController(rootViewController: MainViewController())
    var basketVC = UINavigationController(rootViewController: BasketViewController())

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
     
    }
    
    func setup() {
        tabBar.backgroundColor = .white
        
        mainVC.tabBarItem = UITabBarItem(title: "", image: UIImage(resource: ImageResource.course), selectedImage: UIImage(resource: ImageResource.courseSelected))
        basketVC.tabBarItem = UITabBarItem(title: "", image: UIImage(resource: ImageResource.basket), selectedImage: UIImage(resource: ImageResource.basketSelected))
        setViewControllers([mainVC, basketVC], animated: false)
    }

}
