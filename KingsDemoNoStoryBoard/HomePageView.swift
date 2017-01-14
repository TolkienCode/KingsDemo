//
//  HomePageView.swift
//  KingsDemoNoStoryBoard
//
//  Created by leonchan on 16/12/30.
//  Copyright © 2016年 leonchan. All rights reserved.
//

import UIKit

var pageHeight: CGFloat = 950.0
var screenWidth: CGFloat = 0.0
var screenHeight: CGFloat = 0.0
var imageMargin: CGFloat = 10.0
let sectionMargin: CGFloat = 15.0
let imageCorner: CGFloat = 4.0
let recLabelHeight:CGFloat = 40.0



class SectionView: UIView {
    var title: String?
    var firstLineImage: [UIImage]?
    var secondLineImage: [UIImage]?
    var recFirstLineItemNumber: [Int]?, recSecondLineItemNumber: [Int]?
    
    init(frame: CGRect, title: String, firstLineImage: [UIImage], secondLineImage: [UIImage], recFirstLineItemNumber: [Int], recSecondLineItemNumber: [Int])
    {
        super.init(frame: frame)
        self.title = title
        self.firstLineImage = firstLineImage
        self.secondLineImage = secondLineImage
        self.recFirstLineItemNumber = recFirstLineItemNumber
        self.recSecondLineItemNumber = recSecondLineItemNumber
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let recLabel1 = UILabel(frame: CGRect(x:0.0, y:0.0, width:screenWidth, height:recLabelHeight))
        recLabel1.text = self.title!
        recLabel1.textColor = UIColor.white
        recLabel1.font = UIFont.boldSystemFont(ofSize: 13);
        recLabel1.textAlignment = NSTextAlignment.center
        recLabel1.backgroundColor = UIColor.lightGray
        self.addSubview(recLabel1)
        
        let recImageLine1StartHeight = recLabelHeight + sectionMargin
        let iconImageWidth: CGFloat = (screenWidth - imageMargin * 4) / 3
        
        let recImageView1 = UIButton(frame: CGRect(x:imageMargin, y:recImageLine1StartHeight, width:iconImageWidth, height:iconImageWidth))
        let recImageView2 = UIButton(frame: CGRect(x:imageMargin, y:recImageLine1StartHeight + iconImageWidth + imageMargin, width:iconImageWidth, height:iconImageWidth))
        let recImageView3 = UIButton(frame: CGRect(x:imageMargin + iconImageWidth + imageMargin, y:recImageLine1StartHeight, width:iconImageWidth, height:iconImageWidth))
        let recImageView4 = UIButton(frame: CGRect(x:imageMargin + iconImageWidth + imageMargin, y:recImageLine1StartHeight + iconImageWidth + imageMargin, width:iconImageWidth, height:iconImageWidth))
        let recImageView5 = UIButton(frame: CGRect(x:imageMargin + (iconImageWidth + imageMargin) * 2, y:recImageLine1StartHeight, width:iconImageWidth, height:iconImageWidth))
        let recImageView6 = UIButton(frame: CGRect(x:imageMargin + (iconImageWidth + imageMargin) * 2, y:recImageLine1StartHeight + iconImageWidth + imageMargin, width:iconImageWidth, height:iconImageWidth))
        
        recImageView1.addTarget(HomePageViewController(), action: #selector(HomePageViewController.showDetailPage(sender:)), for: .touchUpInside)
        recImageView2.addTarget(HomePageViewController(), action: #selector(HomePageViewController.showDetailPage(sender:)), for: .touchUpInside)
        recImageView3.addTarget(HomePageViewController(), action: #selector(HomePageViewController.showDetailPage(sender:)), for: .touchUpInside)
        recImageView4.addTarget(HomePageViewController(), action: #selector(HomePageViewController.showDetailPage(sender:)), for: .touchUpInside)
        recImageView5.addTarget(HomePageViewController(), action: #selector(HomePageViewController.showDetailPage(sender:)), for: .touchUpInside)
        recImageView6.addTarget(HomePageViewController(), action: #selector(HomePageViewController.showDetailPage(sender:)), for: .touchUpInside)
        
        print(recImageView1.frame, recImageLine1StartHeight)
        
        recImageView1.setImage(firstLineImage?[0], for: .normal)
        recImageView1.tag = (recFirstLineItemNumber?[0])!
        
        recImageView2.setImage(secondLineImage?[0], for: .normal)
        recImageView2.tag = (recSecondLineItemNumber?[0])!
        
        recImageView3.setImage(firstLineImage?[1], for: .normal)
        recImageView3.tag = (recFirstLineItemNumber?[1])!
        
        recImageView4.setImage(secondLineImage?[1], for: .normal)
        recImageView4.tag = (recSecondLineItemNumber?[1])!
        
        recImageView5.setImage(firstLineImage?[2], for: .normal)
        recImageView5.tag = (recFirstLineItemNumber?[2])!
        
        recImageView6.setImage(secondLineImage?[2], for: .normal)
        recImageView6.tag = (recSecondLineItemNumber?[2])!
        
        /*
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(HomePageViewController.showItemDetailPage(img:)))
        recImageView1.isUserInteractionEnabled = true
        recImageView1.addGestureRecognizer(tapGestureRecognizer)
         */
        
        recImageView1.contentMode = .scaleToFill
        recImageView2.contentMode = .scaleToFill
        recImageView3.contentMode = .scaleToFill
        recImageView4.contentMode = .scaleToFill
        recImageView5.contentMode = .scaleToFill
        recImageView6.contentMode = .scaleToFill
        
        recImageView1.layer.cornerRadius = imageCorner
        recImageView1.clipsToBounds = true
        recImageView2.layer.cornerRadius = imageCorner
        recImageView2.clipsToBounds = true
        recImageView3.layer.cornerRadius = imageCorner
        recImageView3.clipsToBounds = true
        recImageView4.layer.cornerRadius = imageCorner
        recImageView4.clipsToBounds = true
        recImageView5.layer.cornerRadius = imageCorner
        recImageView5.clipsToBounds = true
        recImageView6.layer.cornerRadius = imageCorner
        recImageView6.clipsToBounds = true
        
        self.addSubview(recImageView1)
        self.addSubview(recImageView2)
        self.addSubview(recImageView3)
        self.addSubview(recImageView4)
        self.addSubview(recImageView5)
        self.addSubview(recImageView6)
    }
}

// UIScrollViewDelegate: 为了显示滑动图片＋圆点控制
// UIGestureRecognizerDelegate: 为了响应左右滑动
class HomePageView: UIScrollView, UIGestureRecognizerDelegate, UIScrollViewDelegate
{
    var recFirstLineImage: [UIImage]?
    var recSecondLineImage: [UIImage]?
    var recFirstLineItemNumber: [Int]?, recSecondLineItemNumber: [Int]?
    var pageControl: UIPageControl?
    var headerView: UIScrollView?
    
    
    var homeImgHeight:CGFloat?;
    
    var homeImgView: UIImageView?;
    
    init(frame: CGRect, recFirstLineImage: [UIImage], recSecondLineImage: [UIImage], recFirstLineItemNumber: [Int], recSecondLineItemNumber: [Int]) {
        super.init(frame: frame)
        self.recFirstLineImage = recFirstLineImage
        self.recSecondLineImage = recSecondLineImage
        self.recFirstLineItemNumber = recFirstLineItemNumber
        self.recSecondLineItemNumber = recSecondLineItemNumber
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 在界面上直接点击白色灰色小点跳转到相应图片的时候调用的方法
    func pageControlValueChange(sender: AnyObject?) {
        let pageControl: UIPageControl? = sender as? UIPageControl
        let currentIndex = pageControl!.currentPage
        let offsetX: CGFloat = (CGFloat) (currentIndex) * screenWidth
        headerView?.contentOffset = CGPoint(x: offsetX, y:0)
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
                let offsetX = headerView?.contentOffset.x
                let currentIndex = (Int)(offsetX! / screenWidth)
                print("Swiped right, oldindex=\(pageControl!.currentPage), index=\(currentIndex)")
                pageControl!.currentPage = currentIndex - 1
            case UISwipeGestureRecognizerDirection.left:
                let offsetX = headerView?.contentOffset.x
                let currentIndex = (Int)(offsetX! / screenWidth)
                print("Swiped left, oldindex=\(pageControl!.currentPage), index=\(currentIndex)")
                pageControl!.currentPage = currentIndex + 1
            default:
                break
            }
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let screenSize: CGRect = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        let headerStartHeight:CGFloat = 0.0
        let sectionHeight:CGFloat = 200.0
        
        let headerRect = CGRect(x:0.0, y:headerStartHeight, width:screenWidth, height:sectionHeight)
        headerView = UIScrollView(frame: headerRect)
        
        let headerImage1 = UIImage(named: "和田玉手镯2")
        let headerImageView1 = UIImageView(frame: headerRect)
        headerImageView1.image = headerImage1
        headerImageView1.contentMode = .scaleToFill
        
        let headerImage2 = UIImage(named: "琉璃手串1")
        let headerImageView2 = UIImageView(frame: CGRect(x:0.0 + screenWidth, y:headerStartHeight, width:screenWidth, height:sectionHeight))
        headerImageView2.image = headerImage2
        headerImageView2.contentMode = .scaleToFill
        
        let headerImage3 = UIImage(named: "佛意菩提2")
        let headerImageView3 = UIImageView(frame: CGRect(x:0.0 + screenWidth * 2, y:headerStartHeight, width:screenWidth, height:sectionHeight))
        headerImageView3.image = headerImage3
        headerImageView3.contentMode = .scaleToFill
        
        headerView?.addSubview(headerImageView1)
        headerView?.addSubview(headerImageView2)
        headerView?.addSubview(headerImageView3)
        
        headerView?.isPagingEnabled = true
        headerView?.delegate = self
        headerView?.contentSize = CGSize(width: screenWidth * 3, height: sectionHeight)
        
        pageControl = UIPageControl()
        let pageContrlX = (CGFloat) (screenWidth - 80)
        pageControl?.frame = CGRect(x: pageContrlX, y: sectionHeight - 20.0, width: 80, height: 20)
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
        
        headerView?.addGestureRecognizer(swipeRight)
        headerView?.addGestureRecognizer(swipeLeft)
        
        self.addSubview(headerView!)
        self.addSubview(pageControl!)
        
        
        self.homeImgHeight = 136;
        
        
        
        homeImgView = UIImageView();
        let homeImgY:CGFloat = sectionHeight + headerStartHeight;
        homeImgView!.frame = CGRect(x:0.0, y: homeImgY, width: screenWidth, height: self.homeImgHeight!);
        self.homeImgView?.image = UIImage(named:"HomePic");
        self.addSubview(homeImgView!);
        
        
        
        
        // 新品推荐 - rec
        let recommendationStartHeight = sectionHeight + headerStartHeight
        let iconImageWidth: CGFloat = (screenWidth - imageMargin * 4) / 3
        let recommendationSectionHeight:CGFloat = recLabelHeight + sectionMargin + imageMargin + sectionMargin + iconImageWidth + iconImageWidth
        
        let secView = SectionView(frame: CGRect(x:0.0, y:recommendationStartHeight + self.homeImgHeight!, width: screenWidth, height:recommendationSectionHeight), title: "---  新品推荐  ---", firstLineImage: self.recFirstLineImage!, secondLineImage: self.recSecondLineImage!, recFirstLineItemNumber: self.recFirstLineItemNumber!, recSecondLineItemNumber: self.recSecondLineItemNumber! )
        //let recView = UIView(frame: CGRect(x:0.0, y:recommendationStartHeight, width: screenWidth, height:recommendationSectionHeight))
        secView.backgroundColor = UIColor.white
        self.addSubview(secView)
        
        // 限时秒杀
        let secView2 = SectionView(frame: CGRect(x:0.0, y:recommendationStartHeight + recommendationSectionHeight + self.homeImgHeight!, width: screenWidth, height:recommendationSectionHeight), title: "---  限时秒杀  ---", firstLineImage: self.recFirstLineImage!, secondLineImage: self.recSecondLineImage!, recFirstLineItemNumber: self.recFirstLineItemNumber!, recSecondLineItemNumber: self.recSecondLineItemNumber!)
        secView2.backgroundColor = UIColor.white
        self.addSubview(secView2)
    }

}
