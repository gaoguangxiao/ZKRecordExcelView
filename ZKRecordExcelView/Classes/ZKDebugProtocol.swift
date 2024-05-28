//
//  ZKDebugProtocol.swift
//  RSReading
//
//  Created by 高广校 on 2024/4/2.
//

import Foundation

public protocol ZKDebugProtocol {
    
    // 添加log协议
    func addLog(_ log: String);
}

public protocol ZKDebugViewProtocol {
    
    // 实现log视图
    func addLogView()
}
 
// 记录一次debug周期
public protocol ZKDebugTimerProtocol {
    
    var startTimer: Date? {set get}
    
    var endTimer: Date? {set get}
    
    func getPeriod() -> Double
}

