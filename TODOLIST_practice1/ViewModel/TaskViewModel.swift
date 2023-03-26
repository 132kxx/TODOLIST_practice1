//
//  TaskViewModel.swift
//  TODOLIST_practice1
//
//  Created by kxx: on 2023/03/26.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        getArray()
    }
    
    func getArray() {
        let dommy: [Task] = [
            Task(name: "This is first", isFinished: false),
            Task(name: "This is se", isFinished: true),
            Task(name:  "This is th", isFinished: false)

        ]
        tasks.append(contentsOf: dommy)
    }
    
    func deleteItem(indexset: IndexSet) {
        tasks.remove(atOffsets: indexset)
    }
    
    func moveItem(indexset: IndexSet, to: Int) {
        tasks.move(fromOffsets: indexset, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = Task(name: title, isFinished: false)
        
        tasks.append(newItem)
    }
        
    func updateItem(item: Task) {
        if let index = tasks.firstIndex(where: { $0.id == item.id }) {
            tasks[index] = item.updateCompletion()
            
        }
    }
}
