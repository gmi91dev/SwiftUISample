//
//  GMTextView.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/21.
//

import SwiftUI

struct GMTextView: View {
    
    @Binding var text: String
    
    var placeHolder: String = ""
    var maxCount: Int = 0
    var countFont: Font = .system(size: 12)
    var tintColor: Color = .purple
    
    @State private var count = 0
    @State private var isShowPlaceholder = true
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            TextEditor(text: $text)
                .tint(tintColor)
                .lineSpacing(4) // 行高
                .autocapitalization(.none) // wraps
                .disableAutocorrection(true) // 禁用自动更正功能
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 6, leading: 6, bottom: 0, trailing: 6))
                .scrollContentBackground(.hidden) // 隐藏本身的背景色，iOS16+
                .onChange(of: text, { oldValue, newValue in
                    count = newValue.count
                    isShowPlaceholder = newValue.isEmpty
                })
            
            if (maxCount != 0) {
                HStack(spacing: 8) {
                    if (maxCount-count < 0) {
                        Image(systemName: "exclamationmark.triangle")
                    }
                    Text("\(count)/\(maxCount)")
                }
                .font(countFont)
                .foregroundStyle(maxCount-count >= 0 ? .gray : .red)
                .padding(.horizontal, 8)
                .padding(.vertical, 4)

            }
            
        }
        .overlay(alignment: .topLeading) {
            if (isShowPlaceholder) {
                Text(placeHolder)
                    .foregroundStyle(.gray.opacity(0.6))
                    .padding(.leading, 10)
                    .padding(.top)
            }
        }
        .onAppear {
            count = text.count
            isShowPlaceholder = count == 0 && !placeHolder.isEmpty
        }
    }
}

#Preview {
    @Previewable
    @State
    var text: String = ""
    
    VStack {
        GMTextView(text: $text, placeHolder: "请输入", maxCount: 100)
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
