//
//  LazyStackSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/22.
//

import SwiftUI

enum StackDirection {
    case horizontal, vertical
}

struct LazyStackSample: View {
    
    let direction: StackDirection
    
    var body: some View {
    
        ScrollView(direction == .vertical ? .vertical : .horizontal) {
            
            if direction == .vertical {
                LazyVStack {
                    ForEach(0..<1000) { it in
                        Text("\(it)")
                            .frame(height: 50)
                            .frame(maxWidth: .infinity)
                            .background(.random)
                    }
                }
            }else {
                LazyHStack {
                    ForEach(0..<1000) { it in
                        Text("\(it)")
                            .frame(width: 50)
                            .frame(maxHeight: .infinity)
                            .background(.random)
                    }
                }
                .padding(.vertical)
            }
        }
        
        
    }
}

#Preview {
    LazyStackSample(direction: .horizontal)
}
