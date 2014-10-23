//
//  ViewController.swift
//  KeepingStand
//
//  Created by chenyu on 14-10-14.
//  Copyright (c) 2014年 chenyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lightImageView: UIImageView!
    
    var timer:NSTimer?
    var lightNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "changeLight", userInfo: nil, repeats: true)
    }
    
    func changeLight()
    {
        lightNumber++;
        
        if lightNumber > 12
        {
            lightNumber = 1
        }
        
        var image = UIImage(named: "\(lightNumber).png")
        lightImageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

