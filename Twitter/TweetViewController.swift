//
//  TweetViewController.swift
//  Twitter
//
//  Created by Chaitanya on 10/06/22.
//  Copyright © 2022 Dan. All rights reserved.

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    @IBAction func tweet(_ sender: Any) {
    
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text,  success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: {
                (error) in print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
             
        } else{
            self.dismiss(animated: true, completion: nil)
            }
    }
}

    

