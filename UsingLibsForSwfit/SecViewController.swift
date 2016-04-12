//
//  SecViewController.swift
//  UsingLibsForSwfit
//
//  Created by zjwang on 16/3/21.
//  Copyright © 2016年 Zhangjingwang. All rights reserved.
//
/// webView
import UIKit

class SecViewController: UIViewController, UIWebViewDelegate {

    var textfield = UITextField()
    var webView = UIWebView()
    var activityIndicatorView = UIActivityIndicatorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Do any additional setup after loading the view.
        createWebview()
        createMbprogress()
    }
    // 创建加载指示器
    func createMbprogress()
    {
        activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
        activityIndicatorView.frame = CGRectMake(self.view.frame.size.width/2 - 50, 250, 100, 100)
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.color = UIColor.purpleColor()
        self.view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
    }
    func createWebview()
    {
        self.webView = UIWebView.init(frame: CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 49))
        self.webView.scalesPageToFit = true
        let url  = "http://www.baidu.com"
        // 创 建
        let urlReq = NSURLRequest.init(URL: NSURL.init(string: url)!)
        // load
        self.webView.loadRequest(urlReq)
        self.webView.delegate = self
        self.view.addSubview(self.webView)
    }
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        self.webView.loading
    }
    // 开始
    func webViewDidStartLoad(webView: UIWebView) {
        activityIndicatorView.startAnimating()
    }
    // finish
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicatorView.stopAnimating()
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
