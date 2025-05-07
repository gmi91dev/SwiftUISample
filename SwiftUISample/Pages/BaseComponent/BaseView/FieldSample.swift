//
//  FieldView.swift
//  ThirdPartSample
//
//  Created by gmi91 on 2025/4/18.
//

import SwiftUI

struct FieldSample: View {
    @State private var account = ""
    @State private var password = ""
    
    @State private var text = ""
    
    @State private var subText1 = ""
    @State private var subText2 = ""
    @State private var subText3 = ""
    
    @State private var searchText = ""
    
    @State private var fcText = ""
    @State private var fcText1 = ""
    @State private var fcText2 = ""
    @FocusState private var isFCFocus: Bool
    
    @FocusState private var isFTFocus: FocusType?
    
    enum FocusType: Hashable {
        case fcA, fcB
    }
    
    var body: some View {
        
        ScrollView { // ScrollView里面会不显示Form
            VStack() {
                // 一般用法
                VStack(spacing: 10) {
                    
                    Text(text)
                    
                    VStack(alignment: .leading) {
                        Text("Account")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                        
                        TextField("Account", text: $account, onEditingChanged: { flag in
                            let tip = flag ? "获得" : "失去"
                            text = "Account\(tip)焦点"
                        }, onCommit: {
                            text = "Account tap return"
                        })
                        .font(.system(size: 20))
                        .textFieldStyle(.roundedBorder)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Password")
                            .font(.system(size: 12))
                            .foregroundStyle(.white)
                        
                        SecureField("Password", text: $password, onCommit: {
                            text = "Password tap return"
                        })
                        .font(.system(size: 20))
                        .textFieldStyle(.roundedBorder)
                    }
                    
                    Button {
                        print("login...")
                    } label: {
                        Text("Login")
                    }
                    .bold()
                    .italic()
                    .font(.system(size: 22))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(Color.blue)
                    .cornerRadius(8)
                    
                }
                .padding()
                .background(LinearGradient(colors: [Color.cyan, Color.purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(13)
                .padding()
                
                // onSubmit用法
                VStack {
                    Form {
                        Group {
                            TextField("subText1", text: $subText1)
                                .onSubmit {
                                    print("subText1 onSubmit")
                                }
                            TextField("subText2", text: $subText2)
                                .onSubmit {
                                    print("subText2 onSubmit")
                                }
                        }
                        //                    .submitScope() // 阻断submit的传递，外层的submit将被阻断，此处只会执行subText1 onSubmit
                        .onSubmit {
                            print("Group onSubmit")
                        }
                        TextField("subText3", text: $subText3)
                            .submitLabel(.next) // 设置return按钮
                        //                        .submitScope() // 阻断submit的传递，外层的submit将被阻断，此处subText3 onSubmit不会执行
                            .onSubmit {
                                print("subText3 onSubmit")
                            }
                    }
                    .frame(height: 200)
                    .submitScope() // 阻断submit的传递，外层的submit将被阻断，此处以下三个submit都不会执行
                    .onSubmit {
                        print("Form onSubmit1")
                    }
                    .onSubmit {
                        print("Form onSubmit2")
                    }
                }
                //            .submitScope() // 阻断submit的传递，在该行以下的submit将被阻断，此处VStack onSubmit不会执行
                .onSubmit {
                    print("VStack onSubmit")
                }
                
                // 获取焦点，FocusState用法
                VStack(spacing: 10) {
                    // 基础用法
                    TextField("FocusState", text: $fcText)
                        .focused($isFCFocus)
                    // 进阶
                    TextField("fcText1", text: $fcText1)
                        .keyboardType(.emailAddress) // 设置键盘类型
                        .textContentType(.emailAddress) // 设置输入建议
                        .focused($isFTFocus, equals: .fcA)
                    
                    TextField("fcText2", text: $fcText2)
                        .keyboardType(.numbersAndPunctuation)
                        .textContentType(.password)
                        .focused($isFTFocus, equals: .fcB)
                    
                    // 手动改变焦点，也可在onSubmit中操作，也可通过submit传递特性统一在最外层onSubmit处理
                    // 在macOS中也可结合keyboardShortcut，实现tab键切换焦点
                    // 设置为nil或者false为取消键盘
                    Button {
                        
                        switch isFTFocus {
                        case .fcA:
                            isFTFocus = .fcB
                        default:
                            isFTFocus = .fcA
                        }
                    } label: {
                        let title = isFTFocus == nil ? "Focus" : "Next"
                        Text(title)
                    }
                    
                    
                }
                .onChange(of: isFCFocus) { oldValue, newValue in
                    print("isFCFocus changed from \(oldValue) to \(newValue)")
                }
                .onChange(of: isFTFocus) { oldValue, newValue in
                    print("isFTFocus changed from \(oldValue) to \(newValue)")
                }
                
                Link("格式化数据参考", destination: URL(string:"https://fatbobman.com/zh/posts/textfield-1/")!)
                
            }
            .navigationTitle("FieldView")
            .searchable(text: $searchText)
            .onSubmit(of: .search) { //
                print("searchField commit")
            }
            .onSubmit(of: [.text, .search]) { // 注意onSubmit(of:)的顺序，顺序错乱可能会导致submit不响应事件
                print("onSubmit(of: [.text, .search])")
            }
            .dismissKeyboard()
        }
    }
}

// 通过UIKit方法取消键盘
// 自定义modifier，视图滚动时取消键盘
struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged { _ in
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func dismissKeyboard() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

#Preview {
    FieldSample()
}
