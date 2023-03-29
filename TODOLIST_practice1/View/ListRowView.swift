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
                .foregroundColor(taskItem.isFinished ? .gray.opacity(0.5) : .green)
            Text(taskItem.name)
                .foregroundColor(taskItem.isFinished ? .gray.opacity(0.5) : .green)
                .fontWeight(.semibold)
                
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 10).stroke()
                .foregroundColor(taskItem.isFinished ? .gray.opacity(0.5) : .green)
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var itemModel = Task(name: "hi", isFinished: false)
    
    static var previews: some View {
        MainView()
            .environmentObject(TaskViewModel())
    }
}
