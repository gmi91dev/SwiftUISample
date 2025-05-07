//
//  SwiftUIComponentList.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/18.
//

import SwiftUI

struct SwiftUIComponentList: View {
    
    @State private var baseViews = [
        "Text",
        "Label",
        "Button",
        "TextField",
        "SecueField",
        "TextEditor",
        "Image",
        "Toggle",
        "Picker",
        "DatePicker",
        "ColorPicker",
        "Slider",
        "Stepper"
    ]
    
    @State private var layoutViews = [
        "HStack",
        "VStack",
        "List",
        "LazyHStack",
        "LazyVStack",
        "Grid",
        "LazyHGrid",
        "LazyVGrid",
        "ScrollView"
    ]
    
    @State private var otherViews = [
        "NavigationStack",
        "NavigationLink",
        "Form",
        "Link",
        "ContextMenu",
        "Alert",
        "ActionSheet",
        "Toast"
    ]
    
    var body: some View {
        List {
            Section("BaseViews") {
                ForEach(baseViews, id: \.self) {
                    ComponentListCellView(key: $0)
                }
            }
            
            Section("LayoutViews") {
                ForEach(layoutViews, id: \.self) {
                    ComponentListCellView(key: $0)
                }
            }
            
            Section("OtherViews") {
                ForEach(otherViews, id: \.self) {
                    ComponentListCellView(key: $0)
                }
            }
        }
    }
    
}

struct ComponentListCellView: View {
    
    let key: String
    
    var body: some View {
        
        NavigationLink {
            
            switch key {
            case "Text":
                TextSample()
                    .navigationTitle(key)
            case "Label":
                LabelSample()
                    .navigationTitle(key)
            case "Button":
                ButtonSample()
                    .navigationTitle(key)
            case "TextField", "SecueField":
                FieldSample()
                    .navigationTitle(key)
            case "TextEditor":
                TextEditorSample()
                    .navigationTitle(key)
            case "Image":
                ImageSample()
                    .navigationTitle(key)
            case "Toggle":
                ToggleSample()
                    .navigationTitle(key)
            case "Picker":
                PickerSample()
                    .navigationTitle(key)
            case "DatePicker":
                DatePickerSample()
                    .navigationTitle(key)
            case "ColorPicker":
                ColorPickerSample()
                    .navigationTitle(key)
            case "Slider":
                SliderSample()
                    .navigationTitle(key)
            case "VStack":
                StackSample(direction: .vertical)
                    .navigationTitle(key)
            case "HStack":
                StackSample(direction: .horizontal)
                    .navigationTitle(key)
            case "List":
                ListSample()
                    .navigationTitle(key)
            case "LazyVStack":
                LazyStackSample(direction: .vertical)
                    .navigationTitle(key)
            case "LazyHStack":
                LazyStackSample(direction: .horizontal)
                    .navigationTitle(key)
            default:
                Text("开发中...")
                    .navigationTitle(key)
            }
            
        } label: {
            Text(key)
        }

    }
    
}


#Preview {
    NavigationStack {
        SwiftUIComponentList()
            .navigationTitle("BaseComponents")
            .navigationBarTitleDisplayMode(.inline)
    }
}
