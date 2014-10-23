//
//  ChooseViewController.swift
//  KeepingStand
//
//  Created by chenyu on 14-10-14.
//  Copyright (c) 2014年 chenyu. All rights reserved.
//

import Foundation
import UIKit

var allLevels = [1,0,0,0,0,0]

class ChooseViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    var allButtons = [UIButton]()
    
    @IBAction func turnAnswearVC(sender: AnyObject) {
        
        let btn = sender as UIButton
        let tag = btn.tag
        
        if allLevels[tag - 1] == 1
        {
            var vc = AnswearViewController()
            vc.currentLevel = tag
            
            self.presentViewController(vc, animated: true, completion: nil)
        }else
        {
            var alertView = UIAlertController(title: "提示", message: "亲，你上一关还没过", preferredStyle: UIAlertControllerStyle.Alert)
            var actionYes = UIAlertAction(title: "YES", style: UIAlertActionStyle.Default,handler: nil)
            
            alertView.addAction(actionYes)
            self.presentViewController(alertView, animated: true, completion: nil)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allButtons.append(button1)
        allButtons.append(button2)
        allButtons.append(button3)
        allButtons.append(button4)
        allButtons.append(button5)
        allButtons.append(button6)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewWillAppear(animated: Bool) {
        for i in 0...5
        {
            if allLevels[i] == 1
            {
                allButtons[i].setImage(UIImage(named: "suo_kai.png"), forState: UIControlState.Normal)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

