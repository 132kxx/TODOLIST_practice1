//
//  TaskViewModel.swift
//  TODOLIST_practice1
//
//  Created by kxx: on 2023/03/26.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = [] {
        didSet {
            saveItem()
        }
    }
    let itemskey: String = "items_list"
    
    init() {
        getArray()
    }
    
    func getArray() {
        guard
            let data = UserDefaults.standard.data(forKey: itemskey),
            let decodedData = try? JSONDecoder().decode([Task].self, from: data)
        else { return }
        self.tasks = decodedData
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
    
    func remainItem() -> [Task] {
        let index = tasks.filter({ $0.isFinished == false })
        return index
    }
    
    func completeItem() -> [Task] {
        let index = tasks.filter({ $0.isFinished == true })
        return index
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: itemskey)
        }
    }
}
