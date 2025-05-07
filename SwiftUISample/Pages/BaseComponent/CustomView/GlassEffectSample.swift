//
//  GlassEffectSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/27.
//

import SwiftUI

struct GlassEffectSample: View {
    
    private let gradientSurface = LinearGradient(colors: [.white.opacity(0.1), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    private let gradientBorder = LinearGradient(colors: [.white.opacity(0.5), .white.opacity(0.0), .white.opacity(0.0), .green.opacity(0.0), .green.opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing)
    
    
    private let itemSize = CGSize(width: 160, height: 80)
    
    private let radius: CGFloat = 6
    
    var body: some View {
        
        VStack(spacing: 0) {
                            
            ZStack {
                
                // 加载图片文件
                if let path = Bundle.main.path(forResource: "pexels-blitzboy-1144176", ofType: "jpg"), let img = UIImage(contentsOfFile: path) {
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFill()
                }
                
                Text("毛玻璃效果（无修饰）")
                    .frame(width: 260, height: 160)
                    .gmGlass(forceTint: false)
            }
            
            ZStack {
                
                // 加载图片文件
                if let path = Bundle.main.path(forResource: "pexels-blitzboy-1144176", ofType: "jpg"), let img = UIImage(contentsOfFile: path) {
                    Image(uiImage: img)
                        .resizable()
                        .scaledToFill()
                }
                
                VStack {
                    Spacer()
                    Text("0099009909090900909")
                        .font(
                            .system(
                                size: 20,
                                weight: .medium,
                                design: .monospaced
                            )
                        )
                        .padding(
                            EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0)
                        )
                    
                    Text("30/11")
                        .font(.footnote)
                        .padding(.horizontal, 16)
                    
                    HStack(alignment: .bottom) {
                        Text("ZHANG.SANG")
                            .font(.headline)
                        Spacer()
                        Image("visa")
                            .resizable()
                            .scaledToFit()
                            .opacity(0.6)
                    }
                    .frame(height: 40)
                    .padding(EdgeInsets(top: 0, leading: 16, bottom: 10, trailing: 16))
                    
                    
                    
                }
                .frame(width: 280, height: 160)
                .gmGlass(cornerRadius: 22)
            }

        }
    }
}

extension View {
    
    // 毛玻璃效果
    func gmGlass(cornerRadius: Double = 0.0, forceTint: Bool = true) -> some View {
        self.modifier(
            GMClassModifier(cornerRadius: cornerRadius, forceTint: forceTint)
        )
    }
    
}

// 毛玻璃效果
struct GMClassModifier: ViewModifier {
    
    var cornerRadius = 0.0
    var forceTint = true
    
    func body(content: Content) -> some View {
        
        if forceTint {
            content
                .foregroundStyle(.white.opacity(0.7))
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: cornerRadius))
                .shadow(color: .black.opacity(0.7), radius: 1, x: 0, y: 1)
                .overlay {
                    RoundedRectangle(cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
                        .stroke(.white.opacity(0.3), lineWidth: 1)
                }
        }else {
            content
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: cornerRadius))
                .shadow(color: .black.opacity(0.7), radius: 1, x: 0, y: 1)
                .overlay {
                    RoundedRectangle(cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
                        .stroke(.white.opacity(0.3), lineWidth: 1)
                }
        }
        
    }
    
}


#Preview {
    GlassEffectSample()
}
