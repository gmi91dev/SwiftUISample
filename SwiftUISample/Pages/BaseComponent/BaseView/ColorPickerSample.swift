//
//  ColorPicker.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/26.
//

import SwiftUI

struct ColorPickerSample: View {
    
    @State private var selectedColor: Color = .purple
    
    var body: some View {
        VStack {
            ColorPicker("Color Picker", selection: $selectedColor, supportsOpacity: false)
                .padding()
                .background(.black)
                .cornerRadius(20)
                .foregroundColor(selectedColor)
                .font(.headline)
                .shadow(radius: 10)
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    ColorPickerSample()
}
