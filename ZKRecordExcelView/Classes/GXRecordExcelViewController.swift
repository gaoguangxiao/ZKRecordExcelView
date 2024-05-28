//
//  GXRecordExcelViewController.swift
//  ZKRecordExcelView
//
//  Created by 高广校 on 2024/4/12.
//

import Foundation
import ZKBaseSwiftProject

public class GXRecordExcelViewController: ZKBaseHostingVc<GXRecordExcelView> {
    
    public init(excels: Array<GXRecordExcelModel>) {
        let view = GXRecordExcelView(excels: excels)
        super.init(rootView: view)
        self.modalPresentationStyle = .fullScreen
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func backBtnClick() {
        print("返回")
//        self.dis()
        self.dismiss(animated: false)
    }
}
