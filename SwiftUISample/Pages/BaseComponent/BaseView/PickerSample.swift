//
//  PickerSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/24.
//

import SwiftUI

struct PickerSample: View {
    
    @State private var text = "男"
    
    private var dataList = ["男", "女", "中间"]
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                VStack(spacing: 6) {
                    Text("Style: automatic")
                        .bold()
                    Picker(selection: $text, content: {
                        ForEach(dataList, id: \.self) { item in
                            Text(item)
                        }
                    }) {
                        Text("性别")
                    }
                    .background(.random)
                    .pickerStyle(.automatic)
                }
                
                VStack(spacing: 6) {
                    Text("Style: menu")
                        .bold()
                    Picker(selection: $text, content: {
                        ForEach(dataList, id: \.self) { item in
                            Text(item)
                        }
                    }) {
                        Text("性别")
                    }
                    .background(.random)
                    .pickerStyle(.menu)
                }
                                
                VStack(spacing: 6) {
                    Text("Style: navigationLink")
                        .bold()
                    Picker(selection: $text, content: {
                        ForEach(dataList, id: \.self) { item in
                            Text(item)
                        }
                    }) {
                        Text("性别")
                    }
                    .background(.random)
                    .pickerStyle(.navigationLink)
                }
                
                VStack(spacing: 6) {
                    Text("Style: palette")
                        .bold()
                    Picker(selection: $text, content: {
                        ForEach(dataList, id: \.self) { item in
                            Text(item)
                        }
                    }) {
                        Text("性别")
                    }
                    .background(.random)
                    .pickerStyle(.palette)
                }
                
                VStack(spacing: 6) {
                    Text("Style: segmented")
                        .bold()
                    Picker(selection: $text, content: {
                        ForEach(dataList, id: \.self) { item in
                            Text(item)
                        }
                    }) {
                        Text("性别")
                    }
                    .background(.random)
                    .pickerStyle(.segmented)
                }
                
                VStack(spacing: 6) {
                    Text("Style: wheel")
                        .bold()
                    Picker(selection: $text, content: {
                        ForEach(dataList, id: \.self) { item in
                            Text(item)
                        }
                    }) {
                        Text("性别")
                    }
                    .background(.random)
                    .pickerStyle(.wheel)
                }
                
                VStack(spacing: 6) {
                    Text("Style: inline")
                        .bold()
                    Picker(selection: $text, content: {
                        ForEach(dataList, id: \.self) { item in
                            Text(item)
                        }
                    }) {
                        Text("性别")
                    }
                    .background(.random)
                    .pickerStyle(.inline)
                }
                
                
            }.padding()
        }
 
    }
    
}

#Preview {
    PickerSample()
}
