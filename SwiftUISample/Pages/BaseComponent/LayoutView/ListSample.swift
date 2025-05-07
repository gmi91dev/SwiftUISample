//
//  ListSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/22.
//

import SwiftUI

struct ListSample: View {
    
    @State private var messages = ["1", "2", "3", "4", "5",
                                   "6", "7", "8", "9", "10",
                                   "11", "12", "13", "14", "15"]
    
    var body: some View {
        
        List {
            ForEach(messages, id: \.self) { it in
                Text("第\(it)行")
                    .background(.random)
            }
            .onDelete { offsets in
                messages.remove(atOffsets: offsets)
            }
            .onMove { source, destination in
                messages.move(fromOffsets: source, toOffset: destination)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                EditButton()
            }
        }
//        .listStyle(.plain)
    }
}


#Preview {
    NavigationStack {
        ListSample()
            .navigationBarTitleDisplayMode(.inline)
    }
    .navigationTitle("ListSample")
    
}
