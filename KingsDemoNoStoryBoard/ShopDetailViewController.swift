//
//  ShopDetailViewController.swift
//  KingsDemoNoStoryBoard
//
//  Created by leonchan on 16/12/30.
//  Copyright © 2016年 leonchan. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {

    var shopDetailView: UIScrollView?
    var shopDetailHeaderView: UIScrollView?
    var shopDetailPriceView: UIView?
    var shopDetailRecommendationView: UIView?
    var pageControl: UIPageControl?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        shopDetailView = UIScrollView(frame: CGRect(x:0.0, y:0.0, width: screenWidth, height: screenHeight))
        shopDetailView?.isPagingEnabled = true
        shopDetailView?.delegate = self
        shopDetailView?.showsVerticalScrollIndicator = true
        shopDetailView?.contentSize = CGSize(width: screenWidth, height: pageHeight)

        shopDetailHeaderView = UIScrollView(frame: CGRect(x:0.0, y:0.0, width: screenWidth, height: screenHeight / 2))
        shopDetailHeaderView?.showsVerticalScrollIndicator = false
        
        let headerImage1 = UIImage(named: "1")
        let headerImageView1 = UIImageView(frame: CGRect(x:0.0, y:0.0, width: screenWidth, height: screenHeight / 2))
        headerImageView1.image = headerImage1
        headerImageView1.contentMode = .scaleToFill
        
        let headerImage2 = UIImage(named: "2")
        let headerImageView2 = UIImageView(frame: CGRect(x:0.0 + screenWidth, y:0.0, width:screenWidth, height:screenHeight / 2))
        headerImageView2.image = headerImage2
        headerImageView2.contentMode = .scaleToFill
        
        let headerImage3 = UIImage(named: "3")
        let headerImageView3 = UIImageView(frame: CGRect(x:0.0 + screenWidth * 2, y:0.0, width:screenWidth, height:screenHeight / 2))
        headerImageView3.image = headerImage3
        headerImageView3.contentMode = .scaleToFill
        
        shopDetailHeaderView?.addSubview(headerImageView1)
        shopDetailHeaderView?.addSubview(headerImageView2)
        shopDetailHeaderView?.addSubview(headerImageView3)
        
        shopDetailHeaderView?.isPagingEnabled = true
        shopDetailHeaderView?.contentSize = CGSize(width: screenWidth * 3, height: screenHeight / 2)
        
        pageControl = UIPageControl()
        let pageContrlX = (CGFloat) (screenWidth - 80)
        pageControl?.frame = CGRect(x: pageContrlX, y: screenHeight / 2 - 20.0, width: 80, height: 20)
        pageControl?.numberOfPages = 3
        pageControl?.currentPage = 0
        pageControl?.addTarget(self, action: #selector(pageControlValueChange(sender:)), for: .valueChanged)
        
        // 滑动动作
        // Swipe Gesture Recognizers
        // These can be lets because they aren't mutated and I'm using the latest Selector syntax
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        
        // ViewController will be the delegate for the left and right swipes
        swipeRight.delegate = self
        swipeLeft.delegate = self
        
        shopDetailHeaderView?.addGestureRecognizer(swipeRight)
        shopDetailHeaderView?.addGestureRecognizer(swipeLeft)
        
        shopDetailView?.addSubview(shopDetailHeaderView!)
        shopDetailView?.addSubview(pageControl!)
        //shopDetailView?.addSubview(shopDetailPriceView!)
        //shopDetailView?.addSubview(shopDetailRecommendationView!)
        self.view = shopDetailView
        self.navigationController?.isNavigationBarHidden = false;
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true

        print("shop detail view loaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 在界面上直接点击白色灰色小点跳转到相应图片的时候调用的方法
    func pageControlValueChange(sender: AnyObject?) {
        let pageControl: UIPageControl? = sender as? UIPageControl
        let currentIndex = pageControl!.currentPage
        let offsetX: CGFloat = (CGFloat) (currentIndex) * screenWidth
        shopDetailHeaderView?.contentOffset = CGPoint(x: offsetX, y:0)
        print("currentindex \(currentIndex)")
    }
    
    // 不知道什么时候掉用，大概是停止滑动的时候
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let currentIndex = (Int)(offsetX / screenWidth)
        print("currentindex \(currentIndex)")
        pageControl!.currentPage = currentIndex
    }

    // 识别左右滑动的动作
    // Debugging - All Swipes Are Detected Now
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                let offsetX = shopDetailHeaderView?.contentOffset.x
                let currentIndex = (Int)(offsetX! / screenWidth)
                print("Swiped right, oldindex=\(pageControl!.currentPage), index=\(currentIndex)")
                pageControl!.currentPage = currentIndex - 1
            case UISwipeGestureRecognizerDirection.left:
                let offsetX = shopDetailHeaderView?.contentOffset.x
                let currentIndex = (Int)(offsetX! / screenWidth)
                print("Swiped left, oldindex=\(pageControl!.currentPage), index=\(currentIndex)")
                pageControl!.currentPage = currentIndex + 1
            default:
                break
            }
        }
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
