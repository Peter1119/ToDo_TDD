//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by 홍석현 on 9/26/24.
//

import SwiftUI

struct ToDoItemInputView: View {
    @ObservedObject var data: ToDoItemData
    var didAppear: ((Self) -> Void)?
    @State var withDate = false
    
    var body: some View {
        VStack {
            TextField("Title", text: $data.title)
            Toggle("Add Date", isOn: $withDate)
            if withDate {
                DatePicker("Date", selection: $data.date)
            }
        }
        .onAppear { self.didAppear?(self) }   
    }
}

#Preview {
    ToDoItemInputView(data: ToDoItemData())
}
