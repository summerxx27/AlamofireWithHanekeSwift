//
//  WhatViewController.swift
//  UsingLibsForSwfit
//
//  Created by zjwang on 16/3/21.
//  Copyright © 2016年 Zhangjingwang. All rights reserved.
//

import UIKit

class WhatViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{

//    var collectionView = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.navigationController?.navigationItem.title = "第三夜"
        self.title = "第三夜"
        
        // Do any additional setup after loading the view.
        createCollectionView()
    }
    // 创建collectionView
    func createCollectionView()
    {
        let collectionView =  UICollectionView(frame: CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height), collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.lightGrayColor()
        collectionView.dataSource  = self
        collectionView.delegate = self
        collectionView .registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        self.view.addSubview(collectionView)
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellId", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.cyanColor()
        return cell
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(100, 100)
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let night = NightofFourViewController()
        self.presentViewController(night, animated: true) { () -> Void in
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
