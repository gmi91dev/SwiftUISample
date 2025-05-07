//
//  ContentView.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/16.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        NavigationStack {
            SwiftUIComponentList()
                .navigationTitle("Samples")
                .background(.lightGray)
                .navigationBarTitleDisplayMode(.inline)
        }
        
    }
    
}

#Preview {
    MainView()
}
