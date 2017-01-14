//
//  cargoViewController.swift
//  KingsDemoNoStoryBoard
//
//  Created by HuZhaoLiang on 2017/1/14.
//  Copyright © 2017年 HuZhaoLiang. All rights reserved.
//

import UIKit

class cargoViewController: UIViewController
{
    
    let navigationBarHeight: CGFloat = 64.0
    var navigationBar: UINavigationBar?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigation();
        
        self.view.addSubview(navigationBar!);

    }

    func goBack()
    {
        dismiss(animated: true, completion: nil)
    }
    
    private func setNavigation()
    {
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: self.navigationBarHeight));
        navigationBar!.backgroundColor=UIColor.white;
        
        //let rightButton = UIBarButtonItem(title: "购物车", style: .done, target: nil, action: nil)
        let leftButton = UIBarButtonItem(title: "返回", style: .done, target: nil, action: #selector(cargoViewController.goBack))
        /*
         homeNavigation!.topItem?.title = "首页";
         homeNavigation!.topItem?.rightBarButtonItem = rightButton;
         homeNavigation!.topItem?.leftBarButtonItem = leftButton;
         */
        
        let navItem = UINavigationItem(title: "购物车")
        navItem.leftBarButtonItem = leftButton
        //navItem.rightBarButtonItem = rightButton
        navigationBar!.setItems([navItem], animated: false)
    }
    
    
    
    
    
}



