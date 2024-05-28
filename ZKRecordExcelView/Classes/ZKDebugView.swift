//
//  ZKDebugView.swift
//  RSReading
//
//  Created by 高广校 on 2024/4/2.
//



import Foundation
import GGXSwiftExtension
import ZKBaseSwiftProject

public class ZKDebugView: ZKBaseView, ZKDebugTimerProtocol {
    
    public func getPeriod() -> Double {
        return Date().timeIntervalSince1970 - (startTimer?.timeIntervalSince1970 ?? 0)
    }
    
    public var startTimer: Date?
    
    public var endTimer: Date?
    
    /// log数据记录
    var logs:Array<GXRecordExcelModel> = []
    
    // 停止描述
    public var stopDes: String = ""

    lazy var closeBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("关录", for: .normal)
        btn.addTarget(self, action: #selector(removeView), for: .touchUpInside)
        btn.backgroundColor = .blue
        btn.titleLabel?.font = UIFont.regular(18 * ZKAdapt.factor)
        return btn
    }()
    
    lazy var shareBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("分享", for: .normal)
        btn.addTarget(self, action: #selector(shareText), for: .touchUpInside)
        btn.backgroundColor = .magenta
        btn.titleLabel?.font = UIFont.regular(18 * ZKAdapt.factor)
        return btn
    }()
    
    lazy var emptyBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("插入日志", for: .normal)
        btn.addTarget(self, action: #selector(emptyInserText), for: .touchUpInside)
        btn.backgroundColor = .magenta
        btn.titleLabel?.font = UIFont.regular(18 * ZKAdapt.factor)
        return btn
    }()
    
    lazy var excelBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("日志表格", for: .normal)
        btn.addTarget(self, action: #selector(excelText), for: .touchUpInside)
        btn.backgroundColor = .green
        btn.titleLabel?.font = UIFont.regular(18 * ZKAdapt.factor)
        return btn
    }()
    
    /// 记录原始的Rect
    //    var orignRect: CGRect
    lazy var expandedBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("开录", for: .normal)
        btn.addTarget(self, action: #selector(expandedView), for: .touchUpInside)
        btn.backgroundColor = .blue
//        btn.layer.cornerRadius = 20 * ZKAdapt.factor
        btn.titleLabel?.font = UIFont.regular(18 * ZKAdapt.factor)
        return btn
    }()
    
    private lazy var textView: UITextView = {
        let tV = UITextView()
        tV.font = .regular12
        tV.isEditable = false
        return tV
    }()
    
    public override func setUpView() {
        addSubview(closeBtn)
        addSubview(shareBtn)
        addSubview(excelBtn)
        addSubview(expandedBtn)
        addSubview(textView)
        addSubview(emptyBtn)
        
        closeBtn.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.height.equalTo(40 * ZKAdapt.factor)
        }
        
        shareBtn.snp.makeConstraints { make in
            make.left.equalTo(closeBtn.snp.right)
            make.top.right.equalToSuperview()
            make.width.equalTo(closeBtn.snp.width)
            make.height.equalTo(40 * ZKAdapt.factor)
        }
        
        excelBtn.snp.makeConstraints { make in
            make.top.equalTo(closeBtn.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(40 * ZKAdapt.factor)
        }
        
        textView.snp.makeConstraints { make in
            make.top.equalTo(excelBtn.snp.bottom)
            make.left.right.equalToSuperview()
        }
        
        emptyBtn.snp.makeConstraints { make in
            make.top.equalTo(textView.snp.bottom)
            make.height.equalTo(40 * ZKAdapt.factor)
            make.left.bottom.right.equalToSuperview()
        }
        
        
        expandedBtn.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
          
        //拖曳视图
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(gesture: )))
        self.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view)
//        print("translation: y = \(translation.y)\n translation: x = \(translation.x)")
        gesture.view?.center = CGPoint(x: (gesture.view?.centerX ?? 0) + translation.x ,y: (gesture.view?.center.y ?? 0) + translation.y)
//
        gesture.setTranslation(.zero, in: gesture.view)
    }
    
    @objc func excelText() {
        let vcc = UIApplication.rootWindow?.rootViewController
        let excelVc = GXRecordExcelViewController(excels: logs)
//        vcc?.present(excelVc, animated: false)
//        let logModel = GXRecordExcelModel(text: "测试文本", dutation: "9.3", score: "87.97", stopType: "匹配停止", info: "")
//        let excelVc = GXRecordExcelViewController(excels: [logModel])
        vcc?.present(excelVc, animated: true)
    }
    
    @objc func emptyInserText() {
        
        addLog("插入一条日志")
    }
    
    @objc func shareText() {
        self.openShareText(text: textView.text)
    }
    
    func openShareText(text: String) {
        
        let vcc = UIApplication.rootWindow?.rootViewController
        //        vcc?.presentedViewController
        let activityViewController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        if let popover = activityViewController.popoverPresentationController {
            popover.sourceView = vcc?.view
            popover.sourceRect = vcc?.view.bounds ?? .zero
            popover.permittedArrowDirections = [] // 可以设置为无箭头，使其成为全屏弹窗
        }
        vcc?.present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func removeView() {
        self.textView.isHidden = true
        self.closeBtn.isHidden = true
        self.shareBtn.isHidden = true
        self.emptyBtn.isHidden = true
        self.excelBtn.isHidden = true
        
        self.expandedBtn.isHidden = false
        
        self.snp.remakeConstraints { make in
            make.left.equalTo(UIDevice.getSafeAreaLeft)
            make.centerY.equalToSuperview()
            make.size.equalTo(CGSize(width: 80 * ZKAdapt.factor, height: 80 * ZKAdapt.factor))
        }
        
        self.layoutIfNeeded()
        self.expandedBtn.layer.cornerRadius = self.height/2
    }
    
    @objc func expandedView() {
        self.textView.isHidden = false
        self.closeBtn.isHidden = false
        self.shareBtn.isHidden = false
        self.emptyBtn.isHidden = false
        self.excelBtn.isHidden = false
        
        self.expandedBtn.isHidden = true
        self.snp.remakeConstraints { make in
            make.top.equalTo(StatusBarHeight)
            make.left.equalTo(UIDevice.getSafeAreaLeft + 10 * ZKAdapt.factor)
            make.bottom.equalTo(-UIDevice.getTouchBarHeight - 120 * ZKAdapt.factor)
            make.width.equalTo(350 * ZKAdapt.factor)
        }
    }
    
    public func show(viewController: UIViewController, rect: CGRect) {
        viewController.view.addSubview(self)
        self.removeView()
        self.layer.cornerRadius = 10
    }
    
    ///开始一次log
    public func startRecordLog(timer: Date, text: String) {
        
        self.startTimer = timer
        
    }
    
    ///结束本次log
    public func endRecordLog(text: String, score: Float) {
        
        let duration = self.getPeriod().toFloor(2)
        let logModel = GXRecordExcelModel(text: text, dutation: "\(duration)", score: "\(score)", stopType: stopDes, info: "")
        logs.append(logModel)
    }
    
    //
}

extension ZKDebugView: ZKDebugProtocol {
    
    public func addLog(_ log: String) {
        
        let timer = Date.getCurrentDateStr("yyyy-MM-dd HH:mm:ss SSS")
        
        textView.text = textView.text.appending("\n----------------\n日期：\(timer)\n\(log)")
        
        //自动滚动
        textView.scrollRangeToVisible(NSRange(location: textView.text.count - 1, length: 1))
    }
    
}
