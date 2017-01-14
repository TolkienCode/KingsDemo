//
//  TabViewController.swift
//  KingsDemoNoStoryBoard
//
//  Created by leonchan on 16/12/30.
//  Copyright © 2016年 leonchan. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController, UITabBarControllerDelegate
{
    var homeIcon:UIImage?;
    var shopIcon:UIImage?;
    var carIcon:UIImage?;
    var userIcon:UIImage?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.delegate = self
    }

    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    
        
        self.homeIcon=UIImage();
        //UIImage
        
        // Create Tab one: Home Page
        let tabOne = HomePageViewController()
        let tabOneBarItem = UITabBarItem(title: "首页", image: UIImage(named: "defaultImage.png"), selectedImage: UIImage(named: "selectedImage.png"))
        
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Create Tab two: Shop
        let tabTwo = ShopViewController()
        let tabTwoBarItem = UITabBarItem(title: "玉器古玩", image: UIImage(named: "defaultImage2.png"), selectedImage: UIImage(named: "selectedImage2.png"))
        
        tabTwo.tabBarItem = tabTwoBarItem
        
        // Create Tab three: Whatever..
        //let tabThree = RandomPageViewController()
        let tabThree = CarViewController()
        let tabThreeBarItem = UITabBarItem(title: "豪车", image: UIImage(named: "defaultImage3.png"), selectedImage: UIImage(named: "selectedImage3.png"))
        
        tabThree.tabBarItem = tabThreeBarItem;
        
        // Create Tab four: My Account
        let tabFour = MyAccountViewController()
        let tabFourBarItem = UITabBarItem(title: "用户", image: UIImage(named: "user"), selectedImage: UIImage(named: "selectedImage4.png"))
        
        tabFour.tabBarItem = tabFourBarItem
        
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        // print("Selected \(viewController.title!)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
