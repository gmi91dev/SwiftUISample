//
//  ImageSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/19.
//

import SwiftUI

struct ImageSample: View {
    
    @State private var activeBold = false
    
    var body: some View {
        
        ScrollView {
            VStack(spacing:10) {
                
                // 使用系统symbols
                HStack(spacing: 10) {
                    Image(systemName: "globe.asia.australia")
                        .font(.system(size: 50))
                        .bold(activeBold) // 动态控制bold属性
                        .foregroundStyle(.white)
                    //                .padding(6) // 使用padding属性，改变bold时，整体会大小会变化，因为size没有固定，考虑使用frame
                        .frame(
                            width: 90,
                            height: 90,
                            alignment: .topTrailing
                        ) // alignment调整icon位置
                        .background(
                            LinearGradient(
                                colors: [Color.cyan, Color.purple],
                                startPoint: .topTrailing,
                                endPoint: .bottomLeading
                            )
                        )
                        .cornerRadius(22)
                    
                    Button {
                        activeBold.toggle()
                    } label: {
                        Text("Bold")
                    }
                }
                
                // 渲染模式
                HStack(spacing: 10) {
                    Image(.passport)
                        .renderingMode(.template)
                    
                    Image(.passport)
                        .renderingMode(.original)
                    
                    Image(systemName: "sunrise.fill")
                        .renderingMode(.none)
                        .font(.system(size: 30))
                        .background(.lightGray)
                        .cornerRadius(6)
                    
                    Image(systemName: "sunrise.fill")
                        .renderingMode(.template)
                        .font(.system(size: 30))
                        .background(.lightGray)
                        .cornerRadius(6)
                    
                    Image(systemName: "sunrise.fill")
                        .renderingMode(.original)
                        .font(.system(size: 30))
                        .background(.lightGray)
                        .cornerRadius(6)
                }
                
                // 加载网络图片
                AsyncImage(url: URL(string: "https://images.pexels.com/photos/1379640/pexels-photo-1379640.jpeg?auto=compress&cs=tinysrgb&w=600")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.3).overlay(ProgressView())
                }
                .frame(width: 200, height: 200)
                .cornerRadius(36)
                .overlay(
                    RoundedRectangle(cornerRadius: 36)
                        .stroke(.purple.opacity(0.6), lineWidth: 10)
                )
                
                // 加载图片资源
                VStack(spacing: 10) {
                    // 加载assets图片
                    //                    Image("pexels-dangrab-775687") // 使用资源名称字符串吧
                    Image(.pexelsDangrab775687) // 加载图片，使用resource方式
                        .resizable()
                    //                        .scaledToFit()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 360, height: 200)
                        .cornerRadius(36) // 设置圆角和裁切效果一样
                    //                        .clipped() // 裁切溢出frame的部分
                    
                    // 加载图片文件
                    if let path = Bundle.main.path(forResource: "pexels-blitzboy-1144176", ofType: "jpg"), let img = UIImage(contentsOfFile: path) {
                        Image(uiImage: img)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle()) // 圆形裁切
                    }
                    
                    Image("pexels-dangrab-775687", label: Text("Label")) // label为辅助功能使用
                        .resizable()
                        .scaledToFit()
                    
                    Image(systemName: "swift")
                        .accessibilityLabel("my label") // 辅助功能使用
                        .font(.system(size: 30))
                    
                }
            }
            .padding()
        }
    }
}

#Preview {
    ImageSample()
}
