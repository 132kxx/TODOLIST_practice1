//
//  MainView.swift
//  TODOLIST_practice1
//
//  Created by kxx: on 2023/03/26.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var vm: TaskViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.tasks) { task in
                    ListRowView(taskItem: task)
                        .onTapGesture {
                            withAnimation(.linear) {
                                vm.updateItem(item: task)
                            }
                        }
                }
                .onDelete(perform: vm.deleteItem)
                .onMove(perform: vm.moveItem)
                .onTapGesture {
                    
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("TODO LIST")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .fontWeight(.semibold)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add") {
                        AddView()
                    }
                    .fontWeight(.semibold)

                }
            }
            
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TaskViewModel())
    }
}
