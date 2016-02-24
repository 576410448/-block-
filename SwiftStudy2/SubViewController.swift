//
//  SubViewController.swift
//  SwiftStudy2
//
//  Created by shenj on 15/12/1.
//  Copyright © 2015年 shenj. All rights reserved.
//
//  Swift UIKit 学习阶段  框架搭建

import UIKit

typealias sendValueClosure=(string:String)->Void

class SubViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var myClosure:sendValueClosure?
    
    func initWithClosure(closure:sendValueClosure?){
        myClosure = closure
    }
    
    var dataArray:NSMutableArray!
    var _tableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGrayColor()
        self.navigationItem.title = "test tableView"
        
        self.prepareData()
        self.uiConfig()
        
    }
    
    func prepareData(){
        
        // model实例化
        let model = SubModel.init()
        
        model.labText = "开关是打酱油滴"
        model.img = "pull_end_image_frame_01"
        model.sel = true
        
        // 初始化空数组
        var arr:[AnyObject] = []
        
        for var i = 0 ;i < 10; ++i{
            
            arr.append(model)
        }
        
        // 可变数组初始化
        
        dataArray = NSMutableArray.init(array: arr)
        
        
        
    }
    
    func uiConfig(){
        _tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.Plain)
        _tableView.delegate = self
        _tableView.dataSource = self
        self.view.addSubview(_tableView)
        
        _tableView!.registerNib(UINib(nibName: "SubCell", bundle: nil), forCellReuseIdentifier: "cellid")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cellid")as! SubCell
        
        cell.deal = dataArray[indexPath.row] as?SubModel
        
        
        cell.imgv.userInteractionEnabled = true;
        let gest = UITapGestureRecognizer.init(target: self, action: Selector("selectorAction"))

        cell.imgv.addGestureRecognizer(gest)
        
        return cell
        
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        
        let str = String.init(indexPath.row)
        if (myClosure != nil) {
            myClosure!(string : "回调成功" + str )
        }
    }
    
    
    func selectorAction(){
        print("图片被点击")
        
        if (myClosure != nil){
            myClosure!(string: "block success" )
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
