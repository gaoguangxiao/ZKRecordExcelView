//
//  GXRecordExcelViewModel.swift
//  ZKRecordExcelView
//
//  Created by 高广校 on 2024/4/12.
//

import Foundation

public struct GXRecordExcelViewModel {
 
    public init () {
        
    }
    var excels: [GXRecordExcelModel] = [
        GXRecordExcelModel(text: "Tiger,Tiger", dutation: "10.0", score: "80.9", stopType: "匹配停止", info: "ABCASDADAD"),
        GXRecordExcelModel(text: "Tiger,Tiger", dutation: "10.9",score: "80.9", stopType: "匹配停止", info: "adaef"),
        GXRecordExcelModel(text: "Tiger,Tiger", dutation: "10.9",score: "80.9", stopType: "匹配停止", info: "击列表不同的选项，进入不同的详情页面"),
        GXRecordExcelModel(text: "Tiger,Tiger", dutation: "10.9",score: "80.9", stopType: "匹配停止", info: "击列表不同的选项，进入不同的详情页面"),
        GXRecordExcelModel(text: "Tiger,Tiger", dutation: "10.9",score: "80.9", stopType: "匹配停止", info: "击列表不同的选项，进入不同的详情页面")
    ]
    
    public func getExcelData() -> [GXRecordExcelModel] {
        
        return excels
    }
    
    //
    
}
