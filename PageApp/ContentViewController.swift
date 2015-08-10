//
//  ContentViewController.swift
//  PageApp
//
//  Created by Calvin Cheng on 12/8/15.
//  Copyright © 2015 Hello HQ Pte. Ltd. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    var dataObject: AnyObject?
    
    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        webView.loadHTMLString(dataObject as! String, baseURL: NSURL(string: ""))
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
