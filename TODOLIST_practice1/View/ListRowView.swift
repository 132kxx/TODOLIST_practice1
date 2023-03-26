//
//  ListRowView.swift
//  TODOLIST_practice1
//
//  Created by kxx: on 2023/03/26.
//

import SwiftUI

struct ListRowView: View {
    
    var taskItem: Task
    
    var body: some View {
        HStack {
            Image(systemName: taskItem.isFinished ? "checkmark.circle" : "circle")
            Text(taskItem.name)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var itemModel = Task(name: "hi", isFinished: false)
    
    static var previews: some View {
        ListRowView(taskItem: itemModel)
    }
}
