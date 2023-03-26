//
//  TaskModel.swift
//  TODOLIST_practice1
//
//  Created by kxx: on 2023/03/26.
//

import Foundation
import SwiftUI

struct Task: Identifiable {
    let id: String
    let name: String
    let isFinished: Bool
    
    init(id: String = UUID().uuidString, name: String, isFinished: Bool) {
        self.id = id
        self.name = name
        self.isFinished = isFinished
    }
    
    func updateCompletion() -> Task {
        return Task(id: id, name: name, isFinished: !isFinished)
    }
}
