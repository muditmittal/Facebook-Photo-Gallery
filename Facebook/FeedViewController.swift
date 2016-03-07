//
//  FeedViewController.swift
//  Facebook
//
//  Created by Mudit Mittal on 2/6/16.
//  Copyright © 2016 Mudit Mittal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {

    var selectedImageView: UIImageView!
    var photoTransition: FadeTransition!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {

        super.viewDidLoad()
        scrollView.contentSize = imageView.image!.size
        photoTransition = FadeTransition()

    }
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {

        selectedImageView = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: nil)

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "photoSegue" {
            
            let destinationVC = segue.destinationViewController as! PhotoViewController
            
            //prepares custom segue
            destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationVC.transitioningDelegate = photoTransition
            
            //prepares destination view and transfers tapped image
            destinationVC.view.layoutIfNeeded()
            destinationVC.fullPhotoImageView.image = selectedImageView.image
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
