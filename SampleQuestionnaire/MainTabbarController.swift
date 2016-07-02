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
    var thirdView: ViewController!
    var fourthView: lineUpModalViewController!
    var nav: UINavigationController?
    var nav2: UINavigationController?
    var nav3: UINavigationController?
    var nav4: UINavigationController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView = BaseQuestionnaireListViewController()
        secondView = ViewController()
        thirdView = ViewController()
        fourthView = lineUpModalViewController()
        
        // fontの設定
        let fontFamily: UIFont! = UIFont.systemFontOfSize(10)
        //TabBarの背景色を変更する
        UITabBar.appearance().barTintColor = UIColor.hex("3ca97f", alpha: 1.0)
        // 選択時の設定
        let selectedAttributes = [NSFontAttributeName: fontFamily, NSForegroundColorAttributeName: UIColor.whiteColor()]
        // タイトルテキストカラーの設定
        UITabBarItem.appearance().setTitleTextAttributes(selectedAttributes, forState: UIControlState.Selected)
        // アイコンカラーの設定
        UITabBar.appearance().tintColor = UIColor.whiteColor()
        
        // 非選択時の設定
        let nomalAttributes = [NSFontAttributeName: fontFamily, NSForegroundColorAttributeName: UIColor.whiteColor()]
        /// タイトルテキストカラーの設定
        UITabBarItem.appearance().setTitleTextAttributes(nomalAttributes, forState: UIControlState.Normal)
        
        
        
        //表示するtabItemを指定
        firstView.tabBarItem = UITabBarItem(title: "答える", image: UIImage(named: "check_questionnaire_tab_icon.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "check_questionnaire_tab_icon.png"))
        secondView.tabBarItem = UITabBarItem(title: "質問する", image: UIImage(named: "question_tab_icon.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "question_tab_icon.png"))
        thirdView.tabBarItem = UITabBarItem(title: "累計結果", image: UIImage(named: "result_tab.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "result_tab@2.png"))
        fourthView.tabBarItem = UITabBarItem(title: "マイページ", image: UIImage(named: "user_tab.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "user_tab.png"))
        
        nav = UINavigationController(rootViewController: firstView)
        nav2 = UINavigationController(rootViewController: secondView)
        nav3 = UINavigationController(rootViewController: thirdView)
        nav4 = UINavigationController(rootViewController: fourthView)
        
       //navigationbarとviewがかぶらないようにしている。
        nav!.navigationBar.translucent = false
        nav2!.navigationBar.translucent = false
        nav3!.navigationBar.translucent = false
        nav4!.navigationBar.translucent = false
        
        // タブで表示するViewControllerを配列に格納。
        let tabs = NSArray(objects: nav!, nav2!, nav3!, nav4!)
        
        // 配列をTabにセット。
        self.setViewControllers(tabs as? [UIViewController], animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
}

}

