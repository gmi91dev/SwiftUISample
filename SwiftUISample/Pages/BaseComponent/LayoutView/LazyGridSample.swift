//
//  LazyGridSample.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/22.
//

import SwiftUI

struct LazyGridSample: View {
    @State var data = (1...1000).map{i in CellView(item:i, width: CGFloat(Int.random(in: 30...100)), height: CGFloat(Int.random(in: 40...80)))}
    
    let column1 = [
        GridItem(.adaptive(minimum: 40, maximum: 80))
    ]
    let column2 = [
        GridItem(.flexible()),
    ]
    let column3 = [
        GridItem(.fixed(100)),
    ]
    
    @State var selection = 1
    @State var alignment:HorizontalAlignment = .leading
    @State var alignmentSelection = 0
    @State var spacing:CGFloat = 10
    
    var body: some View {
        VStack{
            Picker("", selection: $selection){
                Text("adaptive").tag(0)
                Text("flexible").tag(1)
                Text("fixed").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            Picker("",selection:$alignmentSelection){
                Text("leading").tag(0)
                Text("center").tag(1)
                Text("trailing").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .labelsHidden()
            Slider(value: $spacing, in: -100...100){Text("spacing")}
            Text("\(spacing)")
                .onChange(of: alignmentSelection) {  oldValue, newValue in
                    switch newValue {
                    case 0:
                        alignment = .leading
                    case 1:
                        alignment = .center
                    case 2:
                        alignment = .trailing
                    default:
                        break
                    }
                }
            Button("shuffle"){
                withAnimation(Animation.easeInOut){
                    data.shuffle()
                }
            }
            ScrollView{
                let colums = [column1,column2,column3]
                LazyVGrid(columns: colums[selection], alignment: alignment, spacing: spacing, pinnedViews: [.sectionHeaders]){
                    Section(header: Text("header")){
                        ForEach(data,id:\.id){ view in
                            view
                        }
                    }
                }
            }
        }
    }
}

struct CellView:View,Identifiable{
    let id = UUID()
    let item:Int
    let width:CGFloat
    let height:CGFloat
    let colors:[Color] = [.red,.blue,.yellow,.purple,.pink,.green]
    var body: some View{
        Rectangle()
            .fill(colors.randomElement() ?? Color.gray)
            .frame(width: width, height: height, alignment: .center)
            .overlay(Text("\(item)").font(.caption2))
    }
}

#Preview {
    LazyGridSample()
}
