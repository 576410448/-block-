//
//  SubCell.swift
//  SwiftStudy2
//
//  Created by shenj on 15/12/1.
//  Copyright © 2015年 shenj. All rights reserved.
//
//  Swift UIKit 学习阶段  框架搭建

import UIKit

typealias  callBack  = ()->Void;

class SubCell: UITableViewCell {
    
    @IBOutlet weak var imgv: UIImageView!
    @IBOutlet weak var titLab: UILabel!
    @IBOutlet weak var testSw: UISwitch!
    
    var subCallBack:callBack!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var deal:SubModel?{
        didSet{
            imgv.image = UIImage(named: (deal!.img)!)!
            
            titLab.text = deal?.labText!
            
            testSw.setOn((deal?.sel)!, animated: true)
            
            testSw.selected = true;
            
        }
    }

    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
