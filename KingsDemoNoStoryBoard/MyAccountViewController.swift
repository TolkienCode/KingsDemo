//
//  MyAccountViewController.swift
//  KingsDemoNoStoryBoard
//
//  Created by leonchan on 16/12/30.
//  Copyright © 2016年 leonchan. All rights reserved.
//

import UIKit

class MyAccountCell: UITableViewCell
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

class MyAccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    var accountView : UIView?;
    var accoutDetail : UIView?;
    var usrIcon : UIImageView?;
    var label1 : UILabel?;
    var label2 : UILabel?;
    var label3 : UILabel?;
    
    
    var accountInfo : UITableView?;
    
    var UserInfo = [String]()
    var OrderInfo = [String]()
    var SettingInfo = [String]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        accountView = UIView(frame: CGRect(x:0.0, y:0.0, width:screenWidth, height:screenHeight/3 - 30));
        accountView?.backgroundColor = UIColor.lightGray;
        
        accoutDetail = UIView();
        accoutDetail?.frame = CGRect(x:0.0, y:screenHeight/3 - 30, width:screenWidth, height:screenHeight - screenHeight/3 + 30);
        accoutDetail?.backgroundColor = UIColor.brown;
        
        usrIcon = UIImageView(image:UIImage(named:"usrIcon"));
        usrIcon!.frame = CGRect(x:screenWidth/3, y:screenHeight/9 - 60, width:screenWidth / 3, height:screenWidth / 3)
        label1 = UILabel();
        label1!.frame = CGRect(x: 0, y:screenHeight/9 + 60, width: screenWidth / 3, height: 50);
        label1!.text = "关注";
        label1!.textAlignment = .center;
        label1!.textColor = UIColor.white;
        
        label2 = UILabel();
        label2!.frame = CGRect(x: screenWidth / 3, y:screenHeight/9 + 60, width: screenWidth / 3, height: 50);
        label2!.text = "粉丝";
        label2!.textAlignment = .center;
        label2!.textColor = UIColor.white;
        
        label3 = UILabel();
        label3!.frame = CGRect(x: screenWidth / 3 * 2, y:screenHeight/9 + 60, width: screenWidth / 3, height: 50);
        label3!.text = "最近访客";
        label3!.textAlignment = .center;
        label3!.textColor = UIColor.white;
        
        accountInfo = UITableView();
        accountInfo?.delegate = self;
        accountInfo?.dataSource = self;
        accountInfo!.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight - screenHeight/3);
        accountInfo?.backgroundColor = UIColor.white;
        
        
        self.UserInfo = ["账户详情", "收藏商品"];
        self.OrderInfo = ["订单管理", "物流查询", "退款查询"];
        self.SettingInfo = ["系统设置", "用户反馈", "系统消息"];
        
        
        accountInfo?.register(MyAccountCell.self, forCellReuseIdentifier: "MyAccountCell")
        
        accountView?.addSubview(usrIcon!);
        accountView?.addSubview(label1!);
        accountView?.addSubview(label2!);
        accountView?.addSubview(label3!);
        accoutDetail?.addSubview(accountInfo!);
        
        self.view.addSubview(accountView!);
        self.view.addSubview(accoutDetail!);
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
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0 {
            return self.UserInfo.count
        }
        if section == 1 {
            return self.OrderInfo.count
        }
        if section == 2 {
            return self.SettingInfo.count
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0 {
            return "用户"
        }
        if section == 1 {
            return "订单"
        }
        if section == 2 {
            return "系统"
        }
        
        return "Default Title"
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:MyAccountCell = tableView.dequeueReusableCell(withIdentifier: "MyAccountCell", for: indexPath as IndexPath) as! MyAccountCell;
        
        // cell.imageView?.image = UIImage(named: "1")
        
        // cell.textLabel?.text = self.itemsToLoad[indexPath.row]
        
        // cell.detailTextLabel?.text = "sample text"
        
        // set item title
        if (indexPath as NSIndexPath).section == 0
        {
            cell.textLabel?.text = self.UserInfo[(indexPath as NSIndexPath).row]
        }
        
        if (indexPath as NSIndexPath).section == 1
        {
            cell.textLabel?.text = self.OrderInfo[(indexPath as NSIndexPath).row]
        }
        
        if (indexPath as NSIndexPath).section == 2
        {
            cell.textLabel?.text = self.SettingInfo[(indexPath as NSIndexPath).row]
        }

        //let imageName = "usrIcon"
        
        //let cellBkImage = UIImage(named: String(imageName))
        //let cellBkImageView = UIImageView(frame: cell.frame)
        //cellBkImageView.image = cellBkImage
        //cellBkImageView.contentMode = .scaleToFill
        
        // cell.backgroundView = cellBkImageView
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // self.performSegue(withIdentifier: "segueDetails", sender: self)
    }
    
    
}
