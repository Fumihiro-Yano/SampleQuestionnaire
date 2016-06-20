//
//  MainTabbarController.swift
//  SampleQuestionnaire
//
//  Created by 矢野史洋 on 2016/06/18.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

//UITabBarControllerを継承
class MainTabbarController: UITabBarController {
    var firstView: BaseQuestionnaireListViewController!
    var secondView: ViewController!
    var nav: UINavigationController?
    var nav2: UINavigationController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView = BaseQuestionnaireListViewController()
        secondView = ViewController()
        //表示するtabItemを指定（今回はデフォルトのItemを使用）
        firstView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Featured, tag: 1)
        secondView.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Bookmarks, tag: 2)
        nav = UINavigationController(rootViewController: firstView)
        nav2 = UINavigationController(rootViewController: secondView)

       //navigationbarとviewがかぶらないようにしている。
        nav!.navigationBar.translucent = false
        nav2!.navigationBar.translucent = false
        
        // タブで表示するViewControllerを配列に格納。
        let tabs = NSArray(objects: nav!, nav2!)
        
        // 配列をTabにセット。
        self.setViewControllers(tabs as? [UIViewController], animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}

}

