//
//  AnswearViewController.swift
//  KeepingStand
//
//  Created by chenyu on 14-10-14.
//  Copyright (c) 2014年 chenyu. All rights reserved.
//

import Foundation
import UIKit

class AnswearViewController: UIViewController {
    
    var currentLevel = 0
    var currentQuestion = 0;
    let allQuestions = [
        ["什么鱼不能吃？", "A 鳄鱼", "B 鲨鱼", "C 木鱼", "D 飞鱼"],
        ["什么东西越洗越脏？", "A 抹布", "B 衣服", "C 白菜", "D 大狗"],
        ["鸟不会得什么病？", "A 痔疮", "B 恐高症", "C 感冒", "D 发烧"],
        ["你孤单时会想谁？", "A 汽水", "B 老师", "C 小伙伴", "D 宠物"]]
    let rightAnswer = [3, 1, 2, 1]
    
    var buttonA = UIButton()
    var buttonB = UIButton()
    var buttonC = UIButton()
    var buttonD = UIButton()
    
    var questionLabel = UILabel()
    var labelA = UILabel()
    var labelB = UILabel()
    var labelC = UILabel()
    var labelD = UILabel()
    var timeLabel = UILabel()
    
    var questonUpdateTimer:NSTimer?
    var countDownTimer:NSTimer?
    
    var timeNum = 20

    var totalNum = 4
    var rightNum = 0
    var wrongNum = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        var backImageView = UIImageView()
        backImageView.frame = CGRectMake(0, 0, 570, 320)
        backImageView.image = UIImage(named: "对战背景05@2x.png")
        self.view.addSubview(backImageView)
        
        var backButton = UIButton()
        backButton.frame = CGRectMake(5, 140, 50, 50)
        backButton.setImage(UIImage(named: "left_arrow.png"), forState: UIControlState.Normal)
        backButton.addTarget(self, action: "turnBack", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(backButton)
        
       
        questionLabel.frame = CGRectMake(120, 90, 320, 80)
        questionLabel.text = allQuestions[0][0]
        questionLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(questionLabel)
        
        
        buttonA.tag = 1
        buttonA.frame = CGRectMake(60, 200, 210, 40)
        buttonA.setImage(UIImage(named: "平时状态@2x.png"), forState: UIControlState.Normal)
        buttonA.addTarget(self, action:"judgeResult:",forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonA)
        
        
        labelA.frame = CGRectMake(60, 200, 210, 40)
        labelA.text = allQuestions[0][1]
        labelA.textColor = UIColor.whiteColor()
        labelA.textAlignment = NSTextAlignment.Center
        self.view.addSubview(labelA)
        
        
        buttonB.tag = 2
        buttonB.frame = CGRectMake(310, 200, 210, 40)
        buttonB.setImage(UIImage(named: "平时状态@2x.png"), forState: UIControlState.Normal)
        buttonB.addTarget(self, action: "judgeResult:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonB)
        
        
        labelB.frame = CGRectMake(310, 200, 210, 40)
        labelB.text = allQuestions[0][2]
        labelB.textColor = UIColor.whiteColor()
        labelB.textAlignment = NSTextAlignment.Center
        self.view.addSubview(labelB)
        
        
        buttonC.tag = 3
        buttonC.frame = CGRectMake(60, 260, 210, 40)
        buttonC.setImage(UIImage(named: "平时状态@2x.png"), forState: UIControlState.Normal)
        buttonC.addTarget(self, action: "judgeResult:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonC)
        
        
        labelC.frame = CGRectMake(60, 260, 210, 40)
        labelC.text = allQuestions[0][3]
        labelC.textColor = UIColor.whiteColor()
        labelC.textAlignment = NSTextAlignment.Center
        self.view.addSubview(labelC)
        
        
        buttonD.tag = 4
        buttonD.frame = CGRectMake(310, 260, 210, 40)
        buttonD.setImage(UIImage(named: "平时状态@2x.png"), forState: UIControlState.Normal)
        buttonD.addTarget(self, action: "judgeResult:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonD)
        
        
        labelD.frame = CGRectMake(310, 260, 210, 40)
        labelD.text = allQuestions[0][4]
        labelD.textColor = UIColor.whiteColor()
        labelD.textAlignment = NSTextAlignment.Center
        self.view.addSubview(labelD)
        
        
        timeLabel.frame = CGRectMake(50, 30, 80, 30)
        timeLabel.text = "00:\(timeNum)"
        timeLabel.backgroundColor = UIColor.blueColor()
        timeLabel.textColor = UIColor.whiteColor()
        timeLabel.textAlignment = NSTextAlignment.Center
        self.view.addSubview(timeLabel)
    }
    
    func turnBack()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func judgeResult(sender:UIButton){
        if sender.tag == rightAnswer[currentQuestion] {
            sender.setImage(UIImage(named:"答对@2x.png"),forState:.Normal)
            rightNum++
        }
        else {
            sender.setImage(UIImage(named:"答错@2x.png"),forState:.Normal)
            wrongNum++
        }
       
        buttonA.enabled = false
        buttonB.enabled = false
        buttonC.enabled = false
        buttonD.enabled = false
        
        questonUpdateTimer?.invalidate()
        questonUpdateTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateQuestion", userInfo: sender, repeats: false)
        
    }
    
    func updateQuestion()
    {
        currentQuestion++
        if currentQuestion >= 4
        {
            //跳转到结果界面
            var rvc = ResultViewController()
            rvc.totalNum = self.totalNum
            rvc.rightNum = self.rightNum
            rvc.wrongNum = self.totalNum - self.rightNum
            rvc.timeNum = 20 - self.timeNum
            
            if self.rightNum >= self.totalNum/2
            {
                allLevels[currentLevel] = 1
            }
            self.presentViewController(rvc, animated: true, completion: nil)
            return
        }
        
        buttonA.enabled = true
        buttonB.enabled = true
        buttonC.enabled = true
        buttonD.enabled = true
        
        questionLabel.text = allQuestions[currentQuestion][0]
        labelA.text = allQuestions[currentQuestion][1]
        labelB.text = allQuestions[currentQuestion][2]
        labelC.text = allQuestions[currentQuestion][3]
        labelD.text = allQuestions[currentQuestion][4]
        
        var sender = questonUpdateTimer?.userInfo as UIButton
        sender.setImage(UIImage(named: "平时状态@2x.png"), forState: UIControlState.Normal)
    }
    
    func setOrignState()
    {
        
        timeNum = 20
        currentQuestion = 0
        totalNum = 4
        rightNum = 0
        
        buttonA.setImage(UIImage(named: "平时状态@2x.png"), forState: UIControlState.Normal)
        buttonB.setImage(UIImage(named: "平时状态@2x.png"), forState: UIControlState.Normal)
        buttonC.setImage(UIImage(named: "平时状态@2x.png"), forState: UIControlState.Normal)
        buttonD.setImage(UIImage(named: "平时状态@2x.png"), forState: UIControlState.Normal)
        
        buttonA.enabled = true
        buttonB.enabled = true
        buttonC.enabled = true
        buttonD.enabled = true
        
        questionLabel.text = allQuestions[currentQuestion][0]
        labelA.text = allQuestions[currentQuestion][1]
        labelB.text = allQuestions[currentQuestion][2]
        labelC.text = allQuestions[currentQuestion][3]
        labelD.text = allQuestions[currentQuestion][4]
    }
    
    func updateTimer()
    {
        timeNum--
        
        if timeNum <= 0
        {
            timeNum = 20
            countDownTimer?.invalidate()
            var alertView = UIAlertController(title: "提示", message: "亲，时间已到", preferredStyle: UIAlertControllerStyle.Alert)
            var actionYes = UIAlertAction(title: "重做", style: UIAlertActionStyle.Default,handler: {act in
            
            })
            var actionNo = UIAlertAction(title: "不重做", style: UIAlertActionStyle.Default,handler: {act in
                //跳转到结果界面
                var rvc = ResultViewController()
                rvc.totalNum = self.totalNum
                rvc.rightNum = self.rightNum
                rvc.wrongNum = self.totalNum - self.rightNum
                rvc.timeNum = 20
                
                if self.rightNum > self.totalNum/2
                {
                    allLevels[self.currentLevel] = 1
                }
                
                self.presentViewController(rvc, animated: true, completion: nil)
            })
            
            alertView.addAction(actionYes)
            alertView.addAction(actionNo)
            self.presentViewController(alertView, animated: true, completion: nil)
        }
        
        if timeNum < 10
        {
            timeLabel.text = "00:0\(timeNum)"
        }else
        {
            timeLabel.text = "00:\(timeNum)"
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        
        countDownTimer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTimer", userInfo: nil, repeats: true)
        
        
        self.setOrignState()
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        countDownTimer?.invalidate()
        
    }
}
