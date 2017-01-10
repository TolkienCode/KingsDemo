//
//  HomePageViewController.swift
//  KingsDemoNoStoryBoard
//
//  Created by leonchan on 16/12/30.
//  Copyright © 2016年 leonchan. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController, UIScrollViewDelegate {
    var homePageView: HomePageView?
    var searchPageView: UIView?
    var backgroundView: UIView?

    private func setupHomePageView() {
        // Do any additional setup after loading the view.
        //let y = (self.navigationController?.navigationBar.frame.height)! * -1
        let recImage1 = UIImage(named: "1")
        
        homePageView = HomePageView(frame: CGRect(x:0.0, y:0.0, width:screenWidth, height:screenHeight), recFirstLineImage: [recImage1!, recImage1!, recImage1!], recSecondLineImage: [recImage1!, recImage1!, recImage1!], recFirstLineItemNumber: [1,2,3], recSecondLineItemNumber: [4,5,6])
        homePageView?.backgroundColor = UIColor.lightGray
        
        /*
        let searchBtn = UIButton(frame: CGRect(x:0, y:0.0, width: screenWidth, height: 20))
        searchBtn.setTitle("search", for: .normal)
        searchBtn.addTarget(self, action: #selector(showSearchPage), for: .touchUpInside)
        homePageView?.addSubview(searchBtn)
         */
        
        // Test
        print("drawing home page")
        print(homePageView!.frame)
    }
    
    func showHomePage()
    {
        let view = UIView(frame: CGRect(x:0.0, y:0.0, width:screenWidth, height:screenHeight))
        //view.addSubview(backgroundView!)
        view.addSubview(homePageView!)
        self.view = view
    }
    
    private func setupSearchPageView()
    {
        let cancelBtn = UIButton(frame: CGRect(x:0, y:10, width: 100, height: 100))
        cancelBtn.setTitle("Cancel", for: UIControlState.normal)
        cancelBtn.addTarget(self, action: #selector(showHomePage), for: .touchUpInside)
        
        searchPageView = UIView(frame: UIScreen.main.bounds)
        searchPageView?.addSubview(cancelBtn)
    }
    
    func showDetailPage(sender: UIButton!)
    {
        print(sender.tag)
        self.navigationController?.pushViewController(ShopDetailViewController(), animated: false)
    }
    
    func setupBackGroundView()
    {
        backgroundView = UIScrollView(frame: CGRect(x:0.0, y:0.0, width:screenWidth, height:pageHeight))
        backgroundView?.backgroundColor = UIColor.lightGray
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Get main screen bounds
        let screenSize: CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        setupHomePageView()
        setupSearchPageView()
        setupBackGroundView()
        //self.view.addSubview(homePageView)
        //self.view.addSubview(searchPageView)
        
        showHomePage();
        
        customizeNavigationBar()
        print("home view did load")
    }

    override func didReceiveMemoryWarning()
    {
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

// navi bar
extension HomePageViewController {
    fileprivate func customizeNavigationBar() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    /*
    fileprivate func createBackButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 22, height: 44))
        button.addTarget(self, action: #selector(showSearchPage) , for: .touchUpInside)
        button.setTitle("<", for: .normal)
        return button
    }
    
    fileprivate func createNavigationBarBackItem(button: UIButton?) -> UIBarButtonItem? {
        guard let button = button else {
            return nil
        }
        
        let buttonItem = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = buttonItem
        return buttonItem
    }*/
}
