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
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                doneList
                
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
            
            .navigationTitle("Done List")
            .toolbarBackground(Color.clear, for: .navigationBar)
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
    var doneList: some View {
        List {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.clear)
                .frame(height: 10)
            
            ForEach(vm.remainItem()) { task in
                HStack {
                    Spacer()
                    ListRowView(taskItem: task)
                        .onTapGesture {
                            withAnimation(.linear) {
                                vm.updateItem(item: task)
                            }
                        }
                    Spacer()
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
            Text("Add")
                .foregroundColor(.black)
                .padding()
                .padding(.horizontal)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
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
