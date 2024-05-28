//
//  ViewController.swift
//  ZKRecordExcelView
//
//  Created by gaoguangxiao125@sina.com on 04/12/2024.
//  Copyright (c) 2024 gaoguangxiao125@sina.com. All rights reserved.
//

import UIKit
import ZKRecordExcelView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //根据文件数据打开表格
    @IBAction func 录音调试(_ sender: Any) {
//        let logModel = GXRecordExcelModel(text: "测试文本", dutation: "9.3", score: "87.97", stopType: "匹配停止", info: "")
        let vcc = UIApplication.rootWindow?.rootViewController
        
        let excels = GXRecordExcelViewModel().getExcelData()
        
//        var logs: Array<GXRecordExcelModel> = []
//        logs.append(logModel)
        
        let excelVc = GXRecordExcelViewController(excels: excels)
//        vcc?.push(excelVc)
        vcc?.present(excelVc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//@available(iOS 17,*)
//#Preview {
//    return ViewController()
//}
