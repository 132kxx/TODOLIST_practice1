//
//  MainView.swift
//  TODOLIST_practice1
//
//  Created by kxx: on 2023/03/26.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var vm: TaskViewModel
    @State private var showSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                taskList
                
                addBtn
                        
                // bottom
                completeList
                
                completeText
            }
            .sheet(isPresented: $showSheet, content: {
                AddView()
                    .presentationDetents([.height(250)])
                    .presentationDragIndicator(.visible)
            })
            
            .navigationTitle("TODO LIST")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Setting") {
                        SettingView()
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                }
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TaskViewModel())
            .preferredColorScheme(.dark)
    }
    
}

extension MainView {
    // MARK: COMPONETN
    var taskList: some View {
        List {
            ForEach(vm.remainItem()) { task in
                ListRowView(taskItem: task)
                    .onTapGesture {
                        withAnimation(.linear) {
                            vm.updateItem(item: task)
                        }
                    }
            }
            .onDelete(perform: vm.deleteItem)
            .onMove(perform: vm.moveItem)
            .listRowSeparator(.hidden)
            
        }
        .listStyle(PlainListStyle())
    }
    
    var addBtn: some View {
        Button {
            showSheet.toggle()
        } label: {
            Text("Add Item!!")
                .foregroundColor(.white)
                .padding()
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.green)
                }
        }
    }
    
    var completeList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(vm.completeItem()) { task in
                    ListRowView(taskItem: task)
                        .onTapGesture {
                            withAnimation(.linear) {
                                vm.updateItem(item: task)
                            }
                        }
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var completeText: some View {
        Text(vm.completeItem().count == 0 ? "NOTHING" : "\(vm.completeItem().count) Item complete")
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .center)
            .underline()
    }
}
