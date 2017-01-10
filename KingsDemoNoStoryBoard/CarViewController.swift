//
//  CarViewController.swift
//  KingsDemoNoStoryBoard
//
//  Created by HuZhaoLiang on 2017/1/10.
//  Copyright © 2017年 leonchan. All rights reserved.
//

import UIKit

class CarViewCell: UITableViewCell
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

class CarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{

    var itemsToLoad: [String] = ["One", "Two", "Three"];
    var imgToload: [String] = ["Car1", "Car2", "Car3"];
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myTableView: UITableView = UITableView()
        
        //myTableView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        myTableView.frame = CGRect(x: CGFloat(0.0), y: CGFloat(0.0), width: screenWidth, height: screenHeight);
        myTableView.dataSource = self;
        myTableView.delegate = self;
        myTableView.rowHeight = screenHeight/3 - 30;
        // myTableView.contentSize = CGSize(width: screenWidth, height: screenHeight)
        
        myTableView.register(CarViewCell.self, forCellReuseIdentifier: "CarViewCell")
        
        self.view.addSubview(myTableView)
        
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return imgToload.count;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:CarViewCell = tableView.dequeueReusableCell(withIdentifier: "CarViewCell", for: indexPath as IndexPath) as! CarViewCell;
        
        
        // cell.imageView?.image = UIImage(named: "1")
        
        //cell.textLabel?.text = self.itemsToLoad[indexPath.row]
        
        // cell.detailTextLabel?.text = "sample text"
        
        
        let cellBkImage = UIImage(named: imgToload[indexPath.row]);
        let cellBkImageView = UIImageView(frame: cell.frame)
        cellBkImageView.image = cellBkImage
        cellBkImageView.contentMode = .scaleToFill
        
        cell.backgroundView = cellBkImageView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
    }

}
