//
//  MainTabbarController.swift
//  Swallow
//
//  Created by 矢野史洋 on 2016/06/18.
//  Copyright © 2016年 矢野史洋. All rights reserved.
//

import UIKit

//UITabBarControllerを継承
class MainTabbarController: UITabBarController {
    var firstView: BaseQuestionnaireListViewController!
    var secondView: BasePostQuestionViewController!
    var thirdView: ViewController!
    var fourthView: MyPageViewController!
    var nav: UINavigationController?
    var nav2: UINavigationController?
    var nav3: UINavigationController?
    var nav4: UINavigationController?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstView = BaseQuestionnaireListViewController()
        secondView = BasePostQuestionViewController()
        thirdView = ViewController()
        fourthView = MyPageViewController()
        
        let tc = TabPageViewController()
        let vc1 = BaseQuestionnaireListViewController()
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor(red: 252/255, green: 150/255, blue: 149/255, alpha: 1.0)
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor(red: 149/255, green: 218/255, blue: 252/255, alpha: 1.0)
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor(red: 149/255, green: 252/255, blue: 197/255, alpha: 1.0)
        let vc5 = UIViewController()
        vc5.view.backgroundColor = UIColor(red: 252/255, green: 182/255, blue: 106/255, alpha: 1.0)
        tc.tabItems = [(vc1, "Mon."), (vc2, "Tue."), (vc3, "Wed."), (vc4, "Thu."), (vc5, "Fri.")]
        tc.isInfinity = true
        var option = TabPageOption()
        option.currentColor = UIColor(red: 246/255, green: 175/255, blue: 32/255, alpha: 1.0)
        tc.option = option
        
        
        
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
        tc.tabBarItem = UITabBarItem(title: "答える", image: UIImage(named: "check_questionnaire_tab_icon.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "check_questionnaire_tab_icon.png"))
        secondView.tabBarItem = UITabBarItem(title: "質問する", image: UIImage(named: "question_tab_icon.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "question_tab_icon.png"))
        thirdView.tabBarItem = UITabBarItem(title: "通知", image: UIImage(named: "alarm.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "result_tab@2.png"))
        fourthView.tabBarItem = UITabBarItem(title: "マイページ", image: UIImage(named: "user_tab.png")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), selectedImage: UIImage(named: "user_tab.png"))
        
        nav = UINavigationController(rootViewController: tc)
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

