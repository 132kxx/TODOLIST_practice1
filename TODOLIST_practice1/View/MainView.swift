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
            VStack {
            if vm.remainItem().count > 0 {
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
            } else {
                Spacer()
                    NavigationLink {
                        AddView()
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
                
            Spacer()
            // bottom line
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
                
                Text(vm.completeItem().count == 0 ? "Complete" : "\(vm.completeItem().count) Item complete")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .underline()
            }

            .navigationTitle("TODO LIST")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink("Add") {
                        AddView()
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.green)

                }
            }
        }
        .tint(.green)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TaskViewModel())
    }
}
