//
//  ToggleSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/21.
//

import SwiftUI

struct ToggleSample: View {
    
    @State private var isOn = false
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            HStack(spacing: 6) {
                Image(systemName: "exclamationmark.triangle")
                    .foregroundStyle(.red)
                Text("Toggle按钮大小是固定的，无法改变")
            }
            
            Toggle("普通开关", isOn: $isOn)
                .tint(.purple) // 设置颜色
                .font(.system(size: 30))
            
            Toggle("普通开关", isOn: $isOn)
                .labelsHidden() // 隐藏文字
            
            // toggleStyle
            Toggle("按钮开关", isOn: $isOn)
                .toggleStyle(ButtonToggleStyle())
            
            // 默认style即DefaultToggleStyle == SwitchToggleStyle
            Toggle("默认开关", isOn: $isOn)
                .toggleStyle(DefaultToggleStyle())
            
            // 自定义style
            Toggle("自定义开关", isOn: $isOn)
                .font(.system(size: 30))
                .labelsHidden() // 此处该方法无效，使用style参数控制文字隐藏
                .toggleStyle(CustomToggleStyle())
            
            Toggle("自定义开关", isOn: $isOn)
                .toggleStyle(CustomToggleStyle(hideTitle: true))
            
        }
        .padding()
    }
}

struct CustomToggleStyle: ToggleStyle {
    
    var hideTitle: Bool = false
    
    @State private var offset = CGSize(width: -10, height: 0)
    
    func makeBody(configuration: Configuration) -> some View {
        
        HStack() {
            
            if (!hideTitle) {
                configuration.label
                Spacer()
            }
            
            VStack {
                RoundedRectangle(cornerSize: CGSize(width: 5, height: 5))
                    .fill(.white)
                    .frame(width: 18, height: 18)
                    .offset(offset)
            }
            .frame(width: 40, height: 20)
            .background(
                RoundedRectangle(cornerSize: CGSize(width: 6, height: 6))
                    .fill(configuration.isOn ? .purple : .gray.opacity(0.2))
            )
            
        }
        .onTapGesture {
            configuration.isOn.toggle()
        }
        .onChange(of: configuration.isOn) { oldValue, newValue in
            withAnimation(.linear(duration: 0.13)) {
                offset = CGSize(
                    width: newValue ? 10 : -10,
                    height: 0
                )
            }
        }
        
        
    }
    
}

#Preview {
    ToggleSample()
}
