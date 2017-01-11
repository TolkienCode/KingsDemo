//
//  HomePageViewController.swift
//  KingsDemoNoStoryBoard
//
//  Created by leonchan on 16/12/30.
//  Copyright © 2016年 leonchan. All rights reserved.
//

import UIKit

let navigationBarHeight:CGFloat = 64.0

class HomePageViewController: UIViewController, UIScrollViewDelegate
{
    var homePageView: HomePageView?
    var homeNavigation: UINavigationBar?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Get main screen bounds
        let screenSize: CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        setupNavigation();
        setupHomePageView();
        
        self.view.addSubview(homeNavigation!)
        self.view.addSubview(homePageView!);
        
        print("home view did load")
    }

    private func setupNavigation()
    {
        homeNavigation = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: navigationBarHeight));
        homeNavigation!.backgroundColor=UIColor.white;
        
        let rightButton = UIBarButtonItem(title: "购物车", style: .done, target: nil, action: nil)
        let leftButton = UIBarButtonItem(title: "搜索", style: .done, target: nil, action: nil)
        /*
        homeNavigation!.topItem?.title = "首页";
        homeNavigation!.topItem?.rightBarButtonItem = rightButton;
        homeNavigation!.topItem?.leftBarButtonItem = leftButton;
        */
        
        let navItem = UINavigationItem(title: "首页")
        navItem.leftBarButtonItem = leftButton
        navItem.rightBarButtonItem = rightButton
        homeNavigation!.setItems([navItem], animated: false)
    }
    
    private func setupHomePageView()
    {
        // Do any additional setup after loading the view.
        // let y = (self.navigationController?.navigationBar.frame.height)! * -1
        let recImage1 = UIImage(named: "1")
        
        homePageView = HomePageView(frame: CGRect(x:0.0, y:navigationBarHeight, width:screenWidth, height:screenHeight), recFirstLineImage: [recImage1!, recImage1!, recImage1!], recSecondLineImage: [recImage1!, recImage1!, recImage1!], recFirstLineItemNumber: [1,2,3], recSecondLineItemNumber: [4,5,6])
        
        homePageView?.contentSize = CGSize(width: screenWidth, height: pageHeight)
        
        homePageView?.isPagingEnabled = true
        // self.delegate = HomePageViewController()
        homePageView?.delegate = self
        homePageView?.showsVerticalScrollIndicator = true
        
        homePageView?.backgroundColor = UIColor.white
    }
    
    func showDetailPage(sender: UIButton!)
    {
        print(sender.tag)
        //elf.navigationController?.pushViewController(ShopDetailViewController(), animated: false)
        present(ShopDetailViewController(), animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

/*
// navi bar
extension HomePageViewController {
    
    fileprivate func customizeNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
}
*/
