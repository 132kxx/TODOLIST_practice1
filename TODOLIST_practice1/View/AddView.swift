//
//  AddView.swift
//  TODOLIST_practice1
//
//  Created by kxx: on 2023/03/26.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var vm: TaskViewModel
    @State var TextFieldText: String = ""
    @State var isAlert: Bool = false
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type Something", text: $TextFieldText)
                    .padding()
                    .background{
                        RoundedRectangle(cornerRadius: 10).stroke()
                            .foregroundColor(.green)
                    }
                
                Button {
                    saveBtn()
                } label: {
                    Text("Submit".uppercased())
                        .fontWeight(.semibold)
                        .foregroundColor(.green)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 50)
                }
               

                Spacer()
            }
            .padding(.horizontal)
            

            .navigationTitle("Add Item")
            .alert(isPresented: $showAlert) {
                getAlert()
            }
        }
    }
    
    func saveBtn() {
        if textAppropriate() {
            vm.addItem(title: TextFieldText)
            TextFieldText = ""
            dismiss()
        } else {
            alertTitle = "please type at least 3 char"
            showAlert.toggle()
        }
    }
    
    func textAppropriate() -> Bool {
        if TextFieldText.count > 2 {
            return true
        } else {
            return false
        }
        
    }
    
    func getAlert() -> Alert {
        Alert(title: Text(alertTitle))
    }
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TaskViewModel())
    }
}
