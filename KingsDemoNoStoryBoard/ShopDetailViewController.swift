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
    
    let navigationBarHeight: CGFloat = 64.0
    var navigationBar: UINavigationBar?
    var detailView:UIView?;
    var titleLabel: UILabel?;
    var priceLabel: UILabel?;
    var commitLabel: UILabel?;
    var descritpion: UITextView?;
    
    
    
    var addButton: UIButton?;
    var attButton: UIButton?;
    var buyButton: UIButton?;
    var bottomView: UIView?;
    
    var picViewHeight:CGFloat?;
    var detailViewHeight: CGFloat?;
    var bottomViewHeight: CGFloat?;
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        picViewHeight=(screenHeight - navigationBarHeight)/7*3 + 16;
        detailViewHeight=(screenHeight - navigationBarHeight)/7*3 + 16;
        bottomViewHeight=(screenHeight - navigationBarHeight)/7 - 32;

        setupNavigation();
        setupPageView();
        setupDetailView();
        setupBottomView();
        
        self.view.addSubview(navigationBar!);
        self.view.addSubview(shopDetailView!);
        self.view.addSubview(detailView!);
        self.view.addSubview(bottomView!);
        print("shop detail view loaded")
    }

    func goBack() {
        dismiss(animated: true, completion: nil)
    }
    
    private func setupNavigation() {
        navigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: self.navigationBarHeight));
        navigationBar!.backgroundColor=UIColor.white;
        
        let rightButton = UIBarButtonItem(title: "购物车", style: .done, target: nil, action: nil)
        let leftButton = UIBarButtonItem(title: "返回", style: .done, target: nil, action: #selector(ShopDetailViewController.goBack))
        /*
         homeNavigation!.topItem?.title = "首页";
         homeNavigation!.topItem?.rightBarButtonItem = rightButton;
         homeNavigation!.topItem?.leftBarButtonItem = leftButton;
         */
        
        let navItem = UINavigationItem(title: "商品详情")
        navItem.leftBarButtonItem = leftButton
        navItem.rightBarButtonItem = rightButton
        navigationBar!.setItems([navItem], animated: false)
    }
    
    private func setupPageView() {
        shopDetailView = UIScrollView(frame: CGRect(x:0.0, y:0.0 + navigationBarHeight, width: screenWidth, height: detailViewHeight!))
        shopDetailView?.isPagingEnabled = true
        shopDetailView?.delegate = self
        shopDetailView?.showsVerticalScrollIndicator = true
        shopDetailView?.contentSize = CGSize(width: screenWidth, height: pageHeight)
        
        //let imageHeight = (screenHeight - navigationBarHeight) / 2
        
        shopDetailHeaderView = UIScrollView(frame: CGRect(x:0.0, y:0.0, width: screenWidth, height: picViewHeight!))
        shopDetailHeaderView?.showsVerticalScrollIndicator = false
        
        let headerImage1 = UIImage(named: "1")
        let headerImageView1 = UIImageView(frame: CGRect(x:0.0, y:0.0, width: screenWidth, height: picViewHeight!))
        headerImageView1.image = headerImage1
        headerImageView1.contentMode = .scaleToFill
        
        let headerImage2 = UIImage(named: "2")
        let headerImageView2 = UIImageView(frame: CGRect(x:0.0 + screenWidth, y:0.0, width:screenWidth, height:picViewHeight!))
        headerImageView2.image = headerImage2
        headerImageView2.contentMode = .scaleToFill
        
        let headerImage3 = UIImage(named: "3")
        let headerImageView3 = UIImageView(frame: CGRect(x:0.0 + screenWidth * 2, y:0.0, width:screenWidth, height:picViewHeight!))
        headerImageView3.image = headerImage3
        headerImageView3.contentMode = .scaleToFill
        
        shopDetailHeaderView?.addSubview(headerImageView1)
        shopDetailHeaderView?.addSubview(headerImageView2)
        shopDetailHeaderView?.addSubview(headerImageView3)
        
        shopDetailHeaderView?.isPagingEnabled = true
        shopDetailHeaderView?.contentSize = CGSize(width: screenWidth * 3, height: picViewHeight!)
        
        pageControl = UIPageControl()
        let pageContrlX = (CGFloat) (screenWidth - 80)
        pageControl?.frame = CGRect(x: pageContrlX, y: picViewHeight! - 20.0, width: 80, height: 20)
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
    
    }
    
    
    private func setupDetailView()
    {
        
        //let secondViewStart = screenHeight / 2 + navigationBarHeight
        
        detailView = UIView();
        detailView?.frame = CGRect(x:0.0, y: navigationBarHeight + picViewHeight!, width: screenWidth, height: detailViewHeight!);
        detailView?.backgroundColor = UIColor.white;
        
        titleLabel = UILabel();
        titleLabel?.frame = CGRect(x:0.0, y:0.0, width: screenWidth, height: detailViewHeight! / 9);
        //titleLabel?.backgroundColor = UIColor.lightGray;
        titleLabel?.text = " 演示商品（商品编号: Y10023033)";
        detailView?.addSubview(titleLabel!);
        
        priceLabel = UILabel();
        priceLabel?.frame = CGRect(x:0.0, y:detailViewHeight! / 9, width: screenWidth, height: detailViewHeight! / 9);
        //titleLabel?.font = UIFont.smallSystemFontSize;
        priceLabel?.textColor = UIColor.red;
        //titleLabel?.font=
        priceLabel?.text = " 价格：¥: 666";
        detailView?.addSubview(priceLabel!);
        
        
        commitLabel = UILabel();
        commitLabel?.frame = CGRect(x:0.0, y:detailViewHeight! / 9 * 2, width: screenWidth, height: detailViewHeight! / 9);
        //titleLabel?.font = UIFont.smallSystemFontSize;
        commitLabel?.textColor = UIColor.black;
        //titleLabel?.font=
        commitLabel?.text = " 累计评价 - 暂无";
        detailView?.addSubview(commitLabel!);
        
        descritpion=UITextView();
        descritpion?.frame=CGRect(x:0.0, y:detailViewHeight! / 9 * 3, width: screenWidth, height: detailViewHeight! / 9 * 6);
        //descritpion!.layer.borderWidth = 1  //边框粗细
        descritpion!.layer.borderColor = UIColor.gray.cgColor //边框颜色
        descritpion!.isEditable = false;
        descritpion!.isSelectable = true;
        //descritpion!.font = UIFont.systemFontSize;
        descritpion?.text = "商品介绍：\n" + "千年血玉为什么会跟血扯上关系？其实主要的依据就是它像血一样红的外观和传说。现在我们就一探究竟，看看千年血玉到底是什么样。\n" + "传说中的千年血玉并不是天然形成的，它那沁入内里的红色，其实是透了血的结果。这到底是怎么一回事？要追溯于人的尸体。当人下葬的时候，作为衔玉的玉器，会被强行塞到人口，随着最后一口气咽下进入咽喉处。咽喉处血管密集，玉器与血经历岁月的融合，便会形成血玉。传说就是这个样子，但事实真的如此吗？其实这是一种不科学的说法！血在地下是会碳化的，更不可能会像无机物那样沁入玉器的里。对于千年血玉的形成，其实是由铁元素造成的。出土血玉显现的红色是因为地下土壤中含有的铁元素或者是陪葬的铁制品被氧化分解，最终沁入玉体里。所以千年血玉才看起来那么红！"
        detailView?.addSubview(descritpion!);
        
        
        

    }
    
    private func setupBottomView()
    {
        bottomView = UIView();
        bottomView?.frame = CGRect(x:0.0, y: navigationBarHeight + picViewHeight! + detailViewHeight!, width: screenWidth, height: bottomViewHeight!);
        bottomView?.backgroundColor = UIColor.white;
        
        
        attButton = UIButton(frame: CGRect(x: 0.0, y: 0.0 + 6 , width: screenWidth/3, height: bottomViewHeight! - 6 ))
        attButton?.setTitle("关注商品", for: .normal)
        attButton?.backgroundColor = UIColor.blue;
        bottomView?.addSubview(attButton!);
        
        buyButton = UIButton(frame: CGRect(x: screenWidth/3*1, y: 0.0 + 6, width: screenWidth/3, height: bottomViewHeight! - 6 ))
        buyButton?.setTitle("收藏店铺", for: .normal)
        buyButton?.backgroundColor = UIColor.red;
        bottomView?.addSubview(buyButton!);
 
        addButton = UIButton(frame: CGRect(x: screenWidth/3*2, y: 0.0 + 6, width: screenWidth/3, height: bottomViewHeight! - 6 ))
        addButton?.setTitle("加入购物车", for: .normal)
        //addButton?.titleLabel?.font = UIFont.systemFont(ofSize: 11);
        addButton?.backgroundColor = UIColor.orange;
        //addButton?.addTarget(target:self, action: <#T##Selector#>, for: <#T##UIControlEvents#>);
        addButton?.addTarget(self, action: Selector("goCart:"), for: .touchUpInside);
        bottomView?.addSubview(addButton!);
        
    }
    
    private func goCart()
    {
        self.present(cargoViewController(), animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 在界面上直接点击白色灰色小点跳转到相应图片的时候调用的方法
    func pageControlValueChange(sender: AnyObject?)
    {
        let pageControl: UIPageControl? = sender as? UIPageControl
        let currentIndex = pageControl!.currentPage
        let offsetX: CGFloat = (CGFloat) (currentIndex) * screenWidth
        shopDetailHeaderView?.contentOffset = CGPoint(x: offsetX, y:0)
        print("currentindex \(currentIndex)")
    }
    
    // 不知道什么时候掉用，大概是停止滑动的时候
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        let offsetX = scrollView.contentOffset.x
        let currentIndex = (Int)(offsetX / screenWidth)
        print("currentindex \(currentIndex)")
        pageControl!.currentPage = currentIndex
    }

    // 识别左右滑动的动作
    // Debugging - All Swipes Are Detected Now
    func respondToSwipeGesture(gesture: UIGestureRecognizer)
    {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer
        {
            switch swipeGesture.direction
            {
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

  

}
