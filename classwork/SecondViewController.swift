//
//  SecondViewController.swift
//  classwork
//
//  Created by Andrew on 20/05/23.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarItem = UITabBarItem(title: "Помощь", image: UIImage(systemName: "sos"), tag: 1)
        navigationItem.title = "Раздел еще в разработке"
    }
}
