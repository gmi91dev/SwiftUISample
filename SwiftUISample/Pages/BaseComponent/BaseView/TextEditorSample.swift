//
//  TextEditorSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/19.
//

import SwiftUI

struct TextEditorSample: View {
        
    @State private var textEditorText: String = ""
        
    var body: some View {
        
        VStack {
            
            GMTextView(text: $textEditorText, placeHolder: "请输入内容", maxCount: 100)
                .font(.system(size: 18))
                .frame(height: 200)
                .foregroundColor(.black)
                .background(Color.lightGray.opacity(0.2)) // 设置背景色
                .cornerRadius(12)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.purple, lineWidth: 2)
                }
                
            
        }
        .padding(.horizontal)
    }
}


#Preview {
    TextEditorSample()
}


