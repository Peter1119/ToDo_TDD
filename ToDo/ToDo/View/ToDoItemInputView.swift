//
//  ToDoItemInputView.swift
//  ToDo
//
//  Created by 홍석현 on 9/26/24.
//

import SwiftUI

struct ToDoItemInputView: View {
    @ObservedObject var data: ToDoItemData
    
    var body: some View {
        TextField("Title", text: $data.title)
    }
}

#Preview {
    ToDoItemInputView(data: ToDoItemData())
}
