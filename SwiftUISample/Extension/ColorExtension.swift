//
//  ColorExtension.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/16.
//

import SwiftUI

// forgroundColor属性即将废弃，使用新的ShapeStyle
extension ShapeStyle where Self == Color {
    
    static var lightGray: Color {
        Color.black.opacity(0.1)
    }
    
    // 随机颜色
    static var random: Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), opacity: 1.0)
    }
    
}

extension Color {
    
    static let lightGray: Color = Color.black.opacity(0.1)
    
    // 随机颜色
    static var random: Color {
        Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1), opacity: 1.0)
    }
}
