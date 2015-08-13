//
//  ViewController.swift
//  PageApp
//
//  Created by Calvin Cheng on 12/8/15.
//  Copyright © 2015 Hello HQ Pte. Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pageController: UIPageViewController?
    var pageContent = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createContentPages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // convenience functions
    func viewControllerAtIndex(index: Int) -> ContentViewController? {
        
        // Check if the page being requested is outside the bounds of available pages by checking if
        // the index reference is zero or greater than the number of items in the pageContent array
        if (pageContent.count == 0) || (index >= pageContent.count) {
            return nil
        }
        
        // if within bounds, let's load up our ContenViewController instance and return it
        let storyBoard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let dataViewController = storyBoard.instantiateViewControllerWithIdentifier("contentView") as! ContentViewController
        dataViewController.dataObject = pageContent[index]
        return dataViewController
    }
    
    func indexOfViewController(viewController: ContentViewController) -> Int {
        
        if let dataObject: AnyObject = viewController.dataObject {
            return pageContent.indexOfObject(dataObject)
        } else {
            return NSNotFound
        }
        
    }
    
    // required methods in order to conform to UIPageViewControllerDelegate
    
    // who's the view controller before the current view controller?
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        
        var index = indexOfViewController(viewController as! ContentViewController)
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        index--
        return viewControllerAtIndex(index)
        
    }
    
    // who's the view controller after the current view controller?
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var index = indexOfViewController(viewController as! ContentViewController)
        
        if index == NSNotFound {
            return nil
        }
        
        index++
        if index == pageContent.count {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }

    func createContentPages() {
        
        var pageStrings = [String]()
        
        for i in 1...11 {
            let contentString = "<html><head></head><body><br><h1>Chapter \(i)</h1><p>This is the page \(i) of content displayed using UIPageViewController in iOS 8.</p></body></html>"
            pageStrings.append(contentString)
        }
        
        pageContent = pageStrings
    }

}

