//
//  TextView.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/18.
//

import SwiftUI

struct TextSample: View {
    var body: some View {
        VStack(spacing: 20) {
            // 基本属性
            Text("hello")
            .bold()//加粗
            .italic()//斜体
            .underline()//下划线
            .underline(true,color: .orange)//下划线的颜色设置为橙色
            .strikethrough()//删除线
            .foregroundStyle(.orange)//设置文本的颜色字体
            .background(Color.purple)//设置文字的背景颜色
            .baselineOffset(5.0)//设置文字内容在文本视图垂直方向上的偏移值
            .background(Image("Picture"),alignment: .bottom)//将一张图片作为文本视图的背景，并设置文字内容位于文本视图的底部
//            .font(.footnote)//设置文字的字体尺寸为注脚样式，设置该属性后字体大小属性将失效
            .font(.system(size: 50))//设置文字的字体尺寸为36
            .font(.system(.title,design:.monospaced))//设置文字字体为标题样式，并可根据屏幕尺寸大小，自动调整自身尺寸
            .font(.custom("BradleyHandITCTT-Bold",size:50))//具有自定义字体的文本视图，并设置字体尺寸为36
            .fontWeight(Font.Weight.heavy)//通过字体粗细属性给它设置加粗效果
            .fontWeight(Font.Weight.ultraLight)//通过字体粗细属性给它设置纤细效果
            
            // Text 可以使用+号连接，组成一个新的Text，从而组合出丰富的文本内容
            Text("Hello, \(Image(systemName: "heart.fill"))")
                .foregroundStyle(.orange)
            +
            Text(Image(systemName: "heart.fill"))
                .font(.system(size: 30))
                .foregroundStyle(.red)
            +
            Text("trail")
                .foregroundStyle(.green)
        
            // 展示日期
            Text(Date(),style: .date)
            // 展示时间
            Text(Date(),style: .time)
            // 计时器，在Text内插入Text
            Text("Timer \(Text(Date(),style: .timer))")
            // 正计时
            Text(Date(),style: .relative)
            // 倒计时
            Text(Date().addingTimeInterval(60),style: .offset)
            
        }
        .navigationTitle("TextView")
    }
}

#Preview {
    TextSample()
}
