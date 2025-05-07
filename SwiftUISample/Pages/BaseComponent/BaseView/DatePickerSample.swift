//
//  DatePickerSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/26.
//

import SwiftUI

struct DatePickerSample: View {
    
    @State private var selectedDate: Date = .now
        
    var body: some View {
        DatePicker("日期选择", selection: $selectedDate)
            .datePickerStyle(.graphical)
            .padding()
            .background(.purple)
            .cornerRadius(20)
            .padding()
    }
}

#Preview {
    DatePickerSample()
}
