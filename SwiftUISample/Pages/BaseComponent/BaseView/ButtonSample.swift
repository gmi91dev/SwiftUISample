//
//  ButtonSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/20.
//

import SwiftUI

struct ButtonSample: View {
    
    @State private var count = 0
    @State private var isSheeting = false
    @State private var tips = "empty"
    
    @State private var isPresented = false
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            Text(tips)
            
            Button {
                count+=1
                isSheeting = true
                tips = "sheet show"
            } label: {
                HStack(spacing: 10) {
                    Image(systemName: "signature")
                    Text("\(count)")
                }
            }
            .font(.system(size: 30))
            .foregroundStyle(.black)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(
                LinearGradient(
                    colors: [Color.cyan, Color.purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(10)
            .sheet(isPresented: $isSheeting) {
                tips = "sheet dismissed"
            } content: {
                Text("this is sheet")
            }

            Button {
                isPresented = true
            } label: {
                Text("confirmationDialog")
            }
            .padding()
            .background(.ultraThinMaterial, in: Capsule())
            .confirmationDialog(
                "确定要删除？",
                isPresented: $isPresented,
                titleVisibility: .visible) {
                    Button("删除", role: .destructive) {
                        // Handle the delete action.
                    }
                    Button("取消", role: .cancel) {
                        
                    }
                } message: {
                    Text("删除后将无法恢复")
                }
            
            Button("按钮样式") { }
            //.buttonStyle(.plain) /* 没有修饰的按钮 */
            //.buttonStyle(.automatic) /* 根据系统自动显示合适的样式 */
            //.buttonStyle(.bordered) /* 灰色背景，蓝色文字，圆角 */
            //.buttonStyle(.borderless) /* 蓝色文字*/
            .buttonStyle(.borderedProminent) /* 蓝色背景，白色文字，圆角 */
            
            Button {
                tips = "点击自动触发"
                count+=1
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: "swift")
                    Text("自定义按钮样式")
                }
                .padding()
                
            }
            .buttonStyle(CustomButtonStyle())
            
            Button {
                tips = "长按1秒触发"
                count+=1
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: "swift")
                    Text("自定义按钮样式(长按)")
                }
                .padding()
                
            }
            .buttonStyle(CustomButtonStyle2())
            
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.white)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.purple)
            )
            .compositingGroup()
//            .opacity(configuration.isPressed ? 0.9 : 1.0)
            .overlay {
                if (configuration.isPressed) {
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                        .stroke(.black.opacity(0.7), lineWidth: 1)
                        .blur(radius: 2)
                }
            }
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
    }
    
}

// PrimitiveButtonStyle需要自己触发按钮事件configuration.trigger()
struct CustomButtonStyle2: PrimitiveButtonStyle {
    
    @GestureState private var pressed = false
        
    func makeBody(configuration: Configuration) -> some View {
        
        let longpress = LongPressGesture(
            minimumDuration: 1.0,
            maximumDistance: 0.0
        )
            .updating($pressed) { value, state, tran in
                state = value
            }
            .onEnded { v in
                configuration.trigger()
            }
        
        return configuration.label
            .foregroundStyle(.white)
            .background(.cyan)
            .clipShape(
                .rect(cornerSize: CGSize(width: 20, height: 10))
            )
//            .shadow(color: .cyan.opacity(0.7), radius: 3)
//            .opacity(pressed ? 0.6 : 1.0)
//            .scaleEffect(pressed ? 0.9 : 1.0)
            .gesture(longpress)
    }
    
}

#Preview {
    ButtonSample()
}
