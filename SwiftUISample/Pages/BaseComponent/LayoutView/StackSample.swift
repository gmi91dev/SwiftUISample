//
//  StackSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/22.
//

import SwiftUI

struct StackSample: View {
    
    let direction: StackDirection
    
    private let hKeys: [String] = ["leading", "center", "trailing"]
    private let vKeys: [String] = ["top", "center", "bottom"]
    
    var body: some View {
        
        if direction == .horizontal {
            // HStack
            VStack(alignment: .leading, spacing: 20) {
                ForEach(vKeys, id: \.self) { k in
                    HCellView(key: k)
                }
            }
        }else {
            // VStack
            HStack(spacing: 20) {
                ForEach(hKeys, id: \.self) { k in
                    VCellView(key: k)
                }
            }
        }
        
    }
}

#Preview {
    StackSample(direction: .horizontal)
}

struct VCellView: View {
    
    var key: String = "center"
    
    var body: some View {
        VStack {
            Text(key)
            VStack(alignment: getAligment(by: key)) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 40, height: 40)
                
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 20, height: 20)
            }
        }
    }
    
    private func getAligment(by key: String) -> HorizontalAlignment {
        switch key {
        case "leading":
            return .leading
        case "trailing":
            return .trailing
        default:
            return .center
        }
    }
    
}

struct HCellView: View {
    
    var key: String = "center"
    
    var body: some View {
        VStack {
            Text(key)
            HStack(alignment: getAligment(by: key)) {
                Rectangle()
                    .fill(.red)
                    .frame(width: 60, height: 60)
                
                Rectangle()
                    .fill(.green)
                    .frame(width: 40, height: 40)
                
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 20, height: 20)
            }
        }
    }
    
    private func getAligment(by key: String) -> VerticalAlignment {
        switch key {
        case "top":
            return .top
        case "bottom":
            return .bottom
        default:
            return .center
        }
    }
    
}
