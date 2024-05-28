//
//  GXRecordDebugView.swift
//  ZKRecordExcelView
//
//  Created by 高广校 on 2024/4/12.
//

import SwiftUI
import ZKBaseSwiftProject

//
public class GXRecordDebugViewKit: ZKBaseHostingVc<GXRecordDebugView> {
    
    public var stopDes: String = ""
    
    public override init(rootView: GXRecordDebugView) {
        super.init(rootView: rootView)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func show(viewController: UIViewController, rect: CGRect) {
        
        let view = GXRecordDebugView()
        let vc = GXRecordDebugViewKit(rootView: view)
        viewController.view.addSubview(vc.view)
       
        view.removeView()
    }
    
    public func endRecordLog(text: String, score: Float) {
        
//        let duration = self.getPeriod().toFloor(2)
//        let logModel = GXRecordExcelModel(text: text, dutation: "\(duration)", score: "\(score)", stopType: stopDes, info: "")
//        logs.append(logModel)
    }
    
}

extension GXRecordDebugViewKit: ZKDebugProtocol {
    public func addLog(_ log: String) {
        
    }
//    public func addLog(_ log: String) {
//    
//        let timer = Date.getCurrentDateStr("yyyy-MM-dd HH:mm:ss SSS")
//        
//        textView.text = textView.text.appending("\n----------------\n日期：\(timer)\n\(log)")
//        
//        //自动滚动
//        textView.scrollRangeToVisible(NSRange(location: textView.text.count - 1, length: 1))
//    }
    
}


public struct GXRecordDebugView: View {
    
    public init() {
        
    }
    
    public var body: some View {
        
        VStack {
            Button("关录") {
                removeView()
            }
            
            Button("分享") {
                shareText()
            }
            
            Button("插入") {
                removeView()
            }
            
        }
    }
    
    
    
     func removeView() {
//        self.textView.isHidden = true
//        self.closeBtn.isHidden = true
//        self.shareBtn.isHidden = true
//        self.emptyBtn.isHidden = true
//        
//        self.expandedBtn.isHidden = false
//        
//        self.snp.remakeConstraints { make in
//            make.left.equalTo(UIDevice.getSafeAreaLeft)
//            make.centerY.equalToSuperview()
//            make.size.equalTo(CGSize(width: 80 * ZKAdapt.factor, height: 80 * ZKAdapt.factor))
//        }
//        
//        self.layoutIfNeeded()
//        self.expandedBtn.layer.cornerRadius = self.height/2
    }
    
    func shareText() {
//        self.openShareText(text: textView.text)
    }
    
}

#Preview {
    GXRecordDebugView()
}
