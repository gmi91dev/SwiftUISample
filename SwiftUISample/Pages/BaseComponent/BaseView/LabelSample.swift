//
//  LabelView.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/18.
//

import SwiftUI

struct LabelSample: View {
    
    var body: some View {
        VStack(spacing: 20) {
            
            Label {
                Text("亚洲")
            } icon: {
                Image(systemName: "globe.asia.australia")
            }
            .font(.system(size: 30))
            .fontWeight(.bold)
            .foregroundStyle(.purple)
            
            Label("Some text", systemImage: "globe.asia.australia")
                .labelStyle(.iconOnly)
            
            Label("Some text", systemImage: "globe.asia.australia")
                .labelStyle(.titleOnly)
            
            // 在contextMenu中使用Label更加便利
            Label("Menu", systemImage: "globe.asia.australia")
                .foregroundStyle(.blue)
                .contextMenu {
                    Button {
                        print("...")
                    } label: {
                        Label("Menu", systemImage: "globe.asia.australia")
                    }

                    Button {
                        print("...")
                    } label: {
                        Label("Menu", systemImage: "globe.asia.australia")
                    }
                    
                }
            
            Label("Menu", systemImage: "globe.asia.australia")
                .labelStyle(CustomLabelStyle())
            
            
        }
        .navigationTitle("LabelView")
    }
}

// 自定义LabelStyle
struct CustomLabelStyle: LabelStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 3) {
            configuration.icon
                .font(.system(size: 24))
            configuration.title
                .font(.system(size: 12))
        }
        .foregroundStyle(.white)
        .frame(width: 60, height: 60)
        .background(LinearGradient(colors: [Color.cyan, Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(13)
    }
    
}


#Preview {
    LabelSample()
}
