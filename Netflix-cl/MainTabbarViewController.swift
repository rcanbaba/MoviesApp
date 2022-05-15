//
//  ViewController.swift
//  Netflix-cl
//
//  Created by Can Babaoğlu on 13.05.2022.
//

import UIKit

class MainTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let upCominViewController = UINavigationController(rootViewController: UpComingViewController())
        let searchViewController = UINavigationController(rootViewController: SearchViewController())
        let downloadsViewController = UINavigationController(rootViewController: DownloadsViewController())
        
        homeViewController.tabBarItem.image = UIImage(systemName: "house")
        upCominViewController.tabBarItem.image = UIImage(systemName: "play.circle")
        searchViewController.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        downloadsViewController.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        homeViewController.title = "Home"
        upCominViewController.title = "Coming Soon"
        searchViewController.title = "Top Search"
        downloadsViewController.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([homeViewController, upCominViewController, searchViewController, downloadsViewController], animated: true)
        
    }


}

