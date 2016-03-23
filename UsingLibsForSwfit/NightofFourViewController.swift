//
//  NightofFourViewController.swift
//  UsingLibsForSwfit
//
//  Created by zjwang on 16/3/22.
//  Copyright © 2016年 Zhangjingwang. All rights reserved.
//

import UIKit

class NightofFourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGrayColor()
        // Do any additional setup after loading the view.
        
        let button = UIButton.init(type: UIButtonType.Custom)
        button.frame = CGRectMake(10, 10, 40, 40)
        self.view.addSubview(button)
        button.setTitle("back", forState: UIControlState.Normal)
        button.addTarget(self, action: "click", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
    }
    func click()
    {
        self.dismissViewControllerAnimated(true) { () -> Void in
            
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
