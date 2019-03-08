//
//  ViewController.swift
//  UIStepper
//
//  Created by 周晓磊 on 2019/3/7.
//  Copyright © 2019 LeoZhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel :UILabel!
    var myStepper :UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        
        // 建立一個 UILabel
        myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        myLabel.text = "0"
        myLabel.textColor = UIColor.black
        myLabel.textAlignment = .center
        myLabel.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.3)
        self.view.addSubview(myLabel)
        
        // 建立一個 UIStepper
        myStepper = UIStepper()
        
        // UIStepper 預設值
        myStepper.value = 0
        
        // UIStepper 最小值
        myStepper.minimumValue = 0
        
        // UIStepper 最大值
        myStepper.maximumValue = 100
        
        // UIStepper 每按一次按鈕 增減的數值
        myStepper.stepValue = 2
        
        // UIStepper 是否可按著增減按鈕持續變化數值
        myStepper.autorepeat = true
        
        // UIStepper 是否可以在變動時同步執行動作
        // 設定 false 時 則是放開按鈕後才會執行動作
        myStepper.isContinuous = true
        
        // UIStepper 數值是否可以循環
        // 例如填 true 時 如果值已達到最大值
        // 再按一次 + 會循環到最小值繼續加
        myStepper.wraps = true
        
        // UIStepper 按下增減按鈕後 執行的動作
        myStepper.addTarget(
            self,
            action:
            #selector(ViewController.onStepperChange),
            for: .valueChanged)
        
        // 設置 UIStepper 位置並放入畫面中
        myStepper.center = CGPoint(
            x: fullScreenSize.width * 0.5,
            y: fullScreenSize.height * 0.5)
        self.view.addSubview(myStepper)
    }
    
    @objc func onStepperChange() {
        // 將 UILabel 的值設置為 UIStepper 目前的值
        myLabel.text = "\(myStepper.value)"
    }


}

