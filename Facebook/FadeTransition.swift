//
//  FadeTransition.swift
//  transitionDemo
//
//  Created by Timothy Lee on 11/4/14.
//  Copyright (c) 2014 Timothy Lee. All rights reserved.
//

import UIKit

class FadeTransition: BaseTransition {

    
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        //cast variables to use during transition
        let tabBarViewController = fromViewController as! UITabBarController
        let navigationController = tabBarViewController.selectedViewController as! UINavigationController
        let feedImageViewController = navigationController.topViewController as! FeedViewController
        let fullImageViewController = toViewController as! PhotoViewController
        
        //define a temporary view
        let movingImageView = UIImageView()
        movingImageView.frame = feedImageViewController.selectedImageView.frame
        movingImageView.bounds = feedImageViewController.selectedImageView.bounds
        movingImageView.image = feedImageViewController.selectedImageView.image
        movingImageView.clipsToBounds = feedImageViewController.selectedImageView.clipsToBounds
        movingImageView.contentMode = feedImageViewController.selectedImageView.contentMode
        movingImageView.contentMode = .ScaleAspectFit
        
        movingImageView.frame.origin.y = feedImageViewController.selectedImageView.frame.origin.y + feedImageViewController.scrollView.frame.origin.y
        containerView.addSubview(movingImageView)
        
        //define initial state of transition
        feedImageViewController.selectedImageView.alpha = 0
        fullImageViewController.fullPhotoImageView.alpha = 0
        toViewController.view.alpha = 0

        UIView.animateWithDuration(duration, animations: {
            //define things that animate
            toViewController.view.alpha = 1
            movingImageView.frame = fullImageViewController.fullPhotoImageView.frame
            
        }) { (finished: Bool) -> Void in
            //define final state of transition
            fullImageViewController.fullPhotoImageView.alpha = 1
            movingImageView.removeFromSuperview()
            feedImageViewController.selectedImageView.alpha = 1
            self.finish()
        }
    }

    
    
    
    
    
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {

        //cast variables to use during transition
        let fullImageViewController = fromViewController as! PhotoViewController
        let tabBarViewController = toViewController as! UITabBarController
        let navigationController = tabBarViewController.selectedViewController as! UINavigationController
        let feedImageViewController = navigationController.topViewController as! FeedViewController
        
        //define a temporary view
        let movingImageView = UIImageView()
        movingImageView.frame = fullImageViewController.fullPhotoImageView.frame
        movingImageView.bounds = fullImageViewController.fullPhotoImageView.bounds
        movingImageView.image = fullImageViewController.fullPhotoImageView.image
        movingImageView.clipsToBounds = fullImageViewController.fullPhotoImageView.clipsToBounds
        movingImageView.contentMode = fullImageViewController.fullPhotoImageView.contentMode
        movingImageView.contentMode = .ScaleAspectFit
        containerView.addSubview(movingImageView)

        //define initial state of transition
        fullImageViewController.fullPhotoImageView.alpha = 0
        feedImageViewController.selectedImageView.alpha = 0
//        toViewController.view.alpha = 0
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            movingImageView.frame = feedImageViewController.selectedImageView.frame
            movingImageView.frame.origin.y += feedImageViewController.scrollView.frame.origin.y
            
        }) { (finished: Bool) -> Void in
            feedImageViewController.selectedImageView.alpha = 1
            movingImageView.removeFromSuperview()
            self.finish()
        }
    }

}
