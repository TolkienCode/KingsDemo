//
//  ShopViewController.swift
//  KingsDemoNoStoryBoard
//
//  Created by leonchan on 16/12/30.
//  Copyright © 2016年 leonchan. All rights reserved.
//

import UIKit

var seasonTitle:String? = "春";
var currentSeason:String?;
var shopNavigation:UINavigationBar?;


class SpringCell: UITableViewCell
{
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

class SummerCell: UITableViewCell
{
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}

class ShopViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate
{
    var shopView: UIScrollView?
    
    var myTableView: UITableView = UITableView()
    var myTableView2: UITableView = UITableView()
    var myTableView3: UITableView = UITableView()
    var myTableView4: UITableView = UITableView()
    
    var itemsToLoad: [String] = ["One", "Two", "Three", "Four", "Five"];
    var pageTitles: [String] = ["春之绿", "夏之魅", "秋之韵", "冬之洁"];
    
    var rightButton: UIBarButtonItem?
    var navItem: UINavigationItem?
    
    // 不知道什么时候掉用，大概是停止滑动的时候
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)
    {
        let offsetX = scrollView.contentOffset.x
        let currentIndex = (Int)(offsetX / screenWidth)
        // print("currentindex \(currentIndex)")
        navItem?.title = pageTitles[currentIndex]
        // pageControl!.currentPage = currentIndex
    }
    
    /*
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // print("scroll view did scroll")
    }
    */
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        // Get main screen bounds
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        //self.navigationController?.isNavigationBarHidden = false;
        //self.navigationController?.navigationBar.barTintColor = UIColor.red;
        //self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: "Heiti SC", size: 24.0)!];
        //self.navigationItem.prompt = "秋";
        //self.navigationItem.title = "春";
        
        shopNavigation = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenWidth, height: navigationBarHeight));
        shopNavigation!.backgroundColor=UIColor.white;
        
        rightButton = UIBarButtonItem(title: "购物车", style: .done, target: nil, action: nil);
        navItem = UINavigationItem(title: "春之绿");
        navItem!.rightBarButtonItem = rightButton;
        
        shopNavigation!.setItems([navItem!], animated: false)
        
        
        //myTableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        myTableView.frame = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: screenWidth, height: screenHeight);
        myTableView.dataSource = self;
        myTableView.delegate = self;
        myTableView.rowHeight = screenHeight / 4;
        // myTableView.contentSize = CGSize(width: screenWidth, height: screenHeight)
        
        myTableView.register(SpringCell.self, forCellReuseIdentifier: "SpringCell")
        
        // mytableview 2
        myTableView2.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        myTableView2.dataSource = self
        myTableView2.delegate = self
        myTableView2.rowHeight = screenHeight / 4
        
        myTableView2.register(SummerCell.self, forCellReuseIdentifier: "SummerCell")
        
        // mytableview 3
        myTableView3.frame = CGRect(x: screenWidth * 2, y: 0, width: screenWidth, height: screenHeight)
        myTableView3.dataSource = self
        myTableView3.delegate = self
        myTableView3.rowHeight = screenHeight / 4
        
        myTableView3.register(SpringCell.self, forCellReuseIdentifier: "SpringCell")
        
        // mytableview 4
        myTableView4.frame = CGRect(x: screenWidth * 3, y: 0, width: screenWidth, height: screenHeight)
        myTableView4.dataSource = self
        myTableView4.delegate = self
        myTableView4.rowHeight = screenHeight / 4
        
        myTableView4.register(SpringCell.self, forCellReuseIdentifier: "SpringCell")
        
        
        // -- setup shopview --
        shopView = UIScrollView(frame: CGRect(x: 0, y: navigationBarHeight, width: screenWidth, height: screenHeight))
        
        // set scroll view delegate
        shopView?.delegate = self
        
        shopView?.contentSize = CGSize(width: screenWidth * 4, height: screenHeight)
        shopView?.isPagingEnabled = true
        
        shopView?.addSubview(myTableView);
        shopView?.addSubview(myTableView2);
        shopView?.addSubview(myTableView3);
        shopView?.addSubview(myTableView4);
        
        self.view.addSubview(shopNavigation!);
        self.view.addSubview(shopView!);
        
        //self.view.addSubview(myTableView);
        //self.view.
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return itemsToLoad.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell: UITableViewCell?
        
        if tableView == myTableView {
            cell = tableView.dequeueReusableCell(withIdentifier: "SpringCell", for: indexPath as IndexPath);
            
        } else if tableView == myTableView2 {
            cell = tableView.dequeueReusableCell(withIdentifier: "SummerCell", for: indexPath as IndexPath);
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "SpringCell", for: indexPath as IndexPath);
        }
        
        cell?.selectionStyle = .none
        
        //cell.imageView?.image = UIImage(named: "1")
        
        //cell.textLabel?.text = self.itemsToLoad[indexPath.row]
        
        //cell.detailTextLabel?.text = "sample text"
        
        let imageName = indexPath.row % 5 + 1
        
        let cellBkImage = UIImage(named: String(imageName))
        let cellBkImageView = UIImageView(frame: cell!.frame)
        cellBkImageView.image = cellBkImage
        cellBkImageView.contentMode = .scaleToFill
        
        cell!.backgroundView = cellBkImageView
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        print("User selected table row \(indexPath.row) and item \(itemsToLoad[indexPath.row])");
        present(ShopDetailViewController(), animated: true, completion: nil);
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
