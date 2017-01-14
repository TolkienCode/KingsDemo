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
    
    
    var bottomHeight:CGFloat?;
    var contentHeight:CGFloat?;
    
    var navigationBar: UINavigationBar?
    var contentView:UIView?;
    var bottomView:UIView?;
    var orderBtn:UIButton?;
    var thinkBtn:UIButton?;
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setNavigation();
        setContent();
        setBottom();
        
        self.view.addSubview(self.navigationBar!);
        self.view.addSubview(self.contentView!);
        self.view.addSubview(self.bottomView!);

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
    
    private func setContent()
    {
        self.contentHeight = (screenHeight - self.navigationBarHeight)/12*11;
        
        self.contentView = UIView();
        self.contentView!.frame = CGRect(x:0.0, y: navigationBarHeight, width: screenWidth, height: self.contentHeight!);
        self.contentView!.backgroundColor = UIColor.white;
        
        
        
        
    }
    
    private func setBottom()
    {
        self.bottomHeight = (screenHeight - self.navigationBarHeight)/12;
        
        self.bottomView = UIView();
        self.bottomView!.frame = CGRect(x:0.0, y: navigationBarHeight + self.contentHeight!, width: screenWidth, height: self.bottomHeight!);
        self.bottomView!.backgroundColor = UIColor.lightGray;
        
        self.thinkBtn = UIButton(frame: CGRect(x: 0.0, y: screenWidth/5*4, width: screenWidth/5, height: bottomHeight! ))
        thinkBtn?.setTitle("再逛逛", for: .normal)
        thinkBtn?.backgroundColor = UIColor.orange;
        bottomView?.addSubview(thinkBtn!);
        
        self.orderBtn = UIButton(frame: CGRect(x: screenWidth/5*4, y: 0.0, width: screenWidth/5, height: bottomHeight! ))
        orderBtn?.setTitle("去结算", for: .normal)
        orderBtn?.backgroundColor = UIColor.red;
        bottomView?.addSubview(orderBtn!);
        
        
    }
    
    
    
    
    
}



