//
//  SliderSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/24.
//

import SwiftUI

struct SliderSample: View {
    
    @State private var sValue = 0.0
    @State private var tips = ""
    
    var body: some View {
        Text(tips)
        Text("\(sValue)")
        Slider(
            value: $sValue,
            in: 0...1,
            step: 0.01) {
                RoundedRectangle(cornerSize: CGSize(width: 3, height: 3))
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("1")
            } onEditingChanged: { flag in
                tips = "onEditingChanged"
            }
            .tint(.purple)
            .padding()
        
        
        

    }
}

#Preview {
    SliderSample()
}
