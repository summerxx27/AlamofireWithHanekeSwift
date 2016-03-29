//
//  ViewController.swift
//  UsingLibsForSwfit
//
//  Created by zjwang on 16/3/21.
//  Copyright © 2016年 Zhangjingwang. All rights reserved.
//

import UIKit
import Alamofire
import Haneke
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var arrayData = NSMutableArray()
    var tableViewself = UITableView()
    var viewHeader = UIView()
    // 刷新
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 创建tableview
        createTableview()
        // 网络请求
        XSummerybcNetworkReq()
        // 创建tableviewheader
        createHeaderView()
        // 刷新控件
        refreshControl.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "松手刷新")
        tableViewself.addSubview(refreshControl)
    }
    // 添加刷新
    func refresh()
    {
        XSummerybcNetworkReq()
    }
    // createT
    func createTableview(){
        tableViewself = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.Plain)
        self.view.addSubview(tableViewself)
        tableViewself.delegate = self
        tableViewself.dataSource = self
        // 注册
        tableViewself.registerClass(TableViewCell.self, forCellReuseIdentifier: "cellId")
        print(sayHello("Xsummerbyc")) // hello, Xsummerbyc!
        
        
    }
    // createHeader
    func sayHello(name: String) ->String
    {
        let results = "hello, " + name + "!"
        return results
    }
    func createHeaderView()
    {
        viewHeader = UIView.init(frame: CGRectMake(20, 20, 325, 100))
        viewHeader.backgroundColor = UIColor.yellowColor()
        let label = UILabel.init(frame: CGRectMake(0, 0, 325, 40))
        viewHeader.addSubview(label)
        label.text = "I am HeaderView"
        tableViewself.tableHeaderView = viewHeader
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return arrayData.count
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = TableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cellId")
        var dic = NSMutableDictionary()
        dic = self.arrayData[indexPath.section] as! NSMutableDictionary
        cell.titleLabel.text = dic["title"] as? String
        cell.titleLabel.numberOfLines = 0
        // 传值进cell, 计算高度
        cell.string = (dic["title"] as? String)!
        // [_modelOne.pic substringToIndex:66]
        let str = dic["pic"] as? NSString
        // 如果崩溃是我找的接口的问题
        if (str != nil && str?.hasSuffix("gif") != nil){
            cell.imagePic.hnk_setImageFromURL(NSURL.init(string:(str?.substringToIndex(66))!)!)
        }
    
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 215
    }
    // 点击方法
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let third = WhatViewController()
        self.navigationController?.pushViewController(third, animated: true)
    }
    // 网络请求
    func XSummerybcNetworkReq()
    {
        let url = "http://api.app.happyjuzi.com/v2.4/article/list/home?&page=1"
        
        
        Alamofire.request(.GET, url).responseJSON() {
            (data) in

            var dic = NSDictionary()
            dic = (data.result.value as? NSDictionary)!;
            let dataDic = dic.valueForKey("data")as! NSDictionary
            // 最内层的字典数组
            let listArray = dataDic.valueForKey("list") as! NSMutableArray
            for dict in listArray{
                // 字典转模型(Swift也是这种说法吧)
                
            }
            // 重新复制 .语法
            self.arrayData = listArray
            if self.arrayData.count > 0{
                self.tableViewself.reloadData()
            }
            self.refreshControl.endRefreshing()

        }
        
//        // 使用SwiftyJSON
//        Alamofire.request(.GET, url).validate().responseJSON { response in
//            switch response.result {
//            case .Success:
//                if let value = response.result.value {
//                    let json = JSON(value)
//                    print("JSON: \(json)")
//                    
//                    
//                }
//            case .Failure(let error):
//                print(error)
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

