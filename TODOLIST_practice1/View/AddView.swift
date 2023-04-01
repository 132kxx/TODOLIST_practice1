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
    @FocusState var focusField: Bool
    @State var showError: String = ""
    @State var isError: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Type Something", text: $TextFieldText)
                    .foregroundColor(.green)
                    .focused($focusField)
                    .padding()
                    .tint(.green)
                    .background{
                        RoundedRectangle(cornerRadius: 10).stroke()
                            .foregroundColor(.black)
                    }
                
                Text(showError)
                    .foregroundColor(.red)
                
                Button {
                    saveBtn()
                } label: {
                    Text("Submit".uppercased())
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 10).stroke()
                                .foregroundColor(.black)
                        }
                    
                }
                .padding(.vertical, 10)
                .padding(.horizontal, 50)
               


                Spacer()
            }
            .padding()
            .padding(.top)
            
            .navigationTitle("Add Item")
        }
        .onAppear {
            focusField = true
        }
    }
}



struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(TaskViewModel())
            .preferredColorScheme(.dark)
    }
}

extension AddView {
    // MARK: FUNCTIONS
    func textAppropriate() -> Bool {
        if TextFieldText.count > 3 {
            return true
        } else {
            isError = true
            return false
        }
    }
    
    func saveBtn() {
        if textAppropriate() {
            vm.addItem(title: TextFieldText)
            TextFieldText = ""
            dismiss()
        } else {
            showError = "please type at least 4 char"
            TextFieldText = ""
        }
    }
    
}
