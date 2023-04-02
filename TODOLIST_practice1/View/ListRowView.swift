//
//  ListRowView.swift
//  TODOLIST_practice1
//
//  Created by kxx: on 2023/03/26.
//

import SwiftUI

struct ListRowView: View {
    
    var taskItem: Task
    
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                Text(taskItem.name)
                    .foregroundColor(.black)
                    .font(.subheadline)
                
                Text("iOS ")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .padding(.horizontal)
        .frame(width: 300, height: 50)
        .background(Color.white)
        .shadow(color: .gray, radius: 20)
        .cornerRadius(10)
    }
}


struct ListRowView_Previews: PreviewProvider {
    
    static var itemModel = Task(name: "hi", isFinished: false)
    
    static var previews: some View {
        MainView()
            .environmentObject(TaskViewModel())
            .preferredColorScheme(.dark)
    }
}
