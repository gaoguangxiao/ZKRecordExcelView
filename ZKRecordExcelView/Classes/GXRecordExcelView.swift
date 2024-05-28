//
//  GXRecordExcelView.swift
//  ZKRecordExcelView
//
//  Created by 高广校 on 2024/4/12.
//

import SwiftUI

public struct GXRecordExcelView: View {
    
    let viewModel = GXRecordExcelViewModel()
    
    public var excels: Array<GXRecordExcelModel>?
  
    public init(excels: Array<GXRecordExcelModel>) {
        self.excels = excels
    }
    
    let titles = ["评测文本", "响应时长", "分数", "停止方式","详细描述"]
    
    public var body: some View {
        
        List {
            HStack {
                ForEach(titles, id: \.self) { title in
                    Text(title)
                        .frame(maxWidth: .infinity,alignment: .leading)
//                    Divider()
                }
            }
            
            ForEach(excels ?? []) { excel in
                HStack(content: {
                    Group {
                        Text(excel.text)
                        Text(excel.dutation)
                        Text(excel.score)
                        Text(excel.stopType)
                        Text(excel.info)
                            .multilineTextAlignment(.center)
                            .frame(maxHeight: .infinity)
                            .font(Font.system(size: 12))
//                            .onTapGesture {
//                                print("点击:\(excel.info)")
//                            }
                    }
                    .lineLimit(1)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                })
                
            }
        }
        
//        .padding(.top,50)
    }
}

#Preview {
    GXRecordExcelView(excels: [])
}
