//
//  GridSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/22.
//

import SwiftUI

struct GridSample: View {
    var body: some View {
        Grid(alignment: .top) {
            GridRow {
                Rectangle().fill(.yellow.gradient)
                    .frame(width: 50.0, height: 50.0)

                Rectangle().fill(.green.gradient)
                    .frame(width: 160.0, height: 60.0)
                
                Rectangle().fill(.green.gradient)
                    .frame(width: 100.0, height: 100.0)
                
                

            }
//            .frame(width: 30, height: 30)

            GridRow {
                Rectangle().fill(.orange.gradient)
                    .frame(width: 100.0, height: 100.0)

                Rectangle().fill(.red.gradient)
                    .frame(width: 50.0, height: 50.0)
            }
        }
    }
}

#Preview {
    GridSample()
}
