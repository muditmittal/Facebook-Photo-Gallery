//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Mudit Mittal on 3/5/16.
//  Copyright © 2016 Mudit Mittal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {
    
    var alpha: CGFloat!
    
    @IBOutlet weak var fullPhotoImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var actionBar: UIView!
    @IBOutlet weak var doneButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1000)
        scrollView.delegate = self
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        alpha = convertValue(scrollView.contentOffset.y, r1Min: -200, r1Max: 100, r2Min: 1, r2Max: 0)
        scrollView.backgroundColor = UIColor(white: 0, alpha: alpha)
        actionBar.alpha = alpha
        doneButton.alpha = alpha
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            
        if scrollView.contentOffset.y > 50 || scrollView.contentOffset.y < -50 {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.scrollView.contentOffset.y = 0
                self.doneButton.alpha = 1
                self.actionBar.alpha = 1
            })
        }

    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 50 || scrollView.contentOffset.y < -50 {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.scrollView.contentOffset.y = 0
                self.doneButton.alpha = 1
                self.actionBar.alpha = 1
            })
        }
    }

    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return fullPhotoImageView
    }
    

    @IBAction func didPressDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
