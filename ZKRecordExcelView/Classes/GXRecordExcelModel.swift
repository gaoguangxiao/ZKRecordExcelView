//
//  GXRecordExcelModel.swift
//  ZKRecordExcelView
//
//  Created by 高广校 on 2024/4/12.
//

import Foundation

//Identifiable 需要为每一个模型添加一个id
public struct GXRecordExcelModel: Identifiable {
    public let id: String = UUID().uuidString
    public var text: String
    public var dutation: String //录音时长
    public var score: String = "0"  //分数
    public var stopType: String //停止方式
    public var info: String = "" //本次录音文本
    
    public init(text: String, dutation: String, score: String, stopType: String, info: String) {
        self.text = text
        self.dutation = dutation
        self.score = score
        self.stopType = stopType
        self.info = info
    }
}
