//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by 홍석현 on 9/26/24.
//

import SwiftUI

struct ToDoItemInputView: View {
    @ObservedObject var toDoItemData: ToDoItemData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ToDoItemInputView(toDoItemData: ToDoItemData())
}
