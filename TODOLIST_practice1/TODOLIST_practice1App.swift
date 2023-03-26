//
//  TODOLIST_practice1App.swift
//  TODOLIST_practice1
//
//  Created by kxx: on 2023/03/26.
//

import SwiftUI

@main
struct TODOLIST_practice1App: App {
    
    @StateObject var vm: TaskViewModel = TaskViewModel()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(vm)
        }
    }
}
