//
//  ViewController.swift
//  SwiftStudy2
//
//  Created by shenj on 15/12/1.
//  Copyright © 2015年 shenj. All rights reserved.
//
//  Swift UIKit 学习阶段  框架搭建

import UIKit

class ViewController: UIViewController {
    
    class subVC: SubViewController {
        
    }

    @IBOutlet weak var testLabel: UILabel!
    
    @IBOutlet weak var testBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRectMake(10,20,300,100))
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.textAlignment = NSTextAlignment.Center
        
        label.text = "Swift UIKit"
        self.view.addSubview(label)
        
        testLabel.text = "StoryBoard Text"
        
        testBtn .setTitle("StoryBoard Btn", forState: UIControlState.Normal);
        testBtn.layer.borderWidth = 1;
        testBtn.layer.cornerRadius = 5;
        testBtn.layer.borderColor = UIColor.redColor().CGColor
        
        testBtn .addTarget(self, action: Selector("nextBtnClicked"), forControlEvents: UIControlEvents.TouchUpInside)
        
    }

    
    func someFunctionThatTakesAClosure(string:String) -> Void {
        
        testLabel.text = string
    }
    
    func nextBtnClicked(){
        
        let second = SubViewController(nibName:nil,bundle:nil)
        second.initWithClosure(someFunctionThatTakesAClosure)
        self.navigationController!.pushViewController(second,animated:true)

    }
    
    override func viewWillDisappear(animated: Bool) {
        testLabel.text = "StoryBoard Text"
    }

}


