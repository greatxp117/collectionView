//
//  TimeCodeCell.swift
//  AddCollectionView
//
//  Created by Xavier Polisetty on 8/19/21.
//

import SwiftUI

struct TimeCodeCell: View {
    
    var minutes: String
    @State var selected: Bool = false
    
    var body: some View {
        if self.selected {
            ZStack {
                RoundedRectangle(cornerRadius: 4.0)
                    .foregroundColor(Color(.systemGray5))
                Text(":" + minutes)
                
            }
            .onTapGesture {
                self.selected.toggle()
            }
                
                
        } else {
            Text(":" + minutes)
                .onTapGesture {
                    self.selected.toggle()
                }
        }
    }
}

struct TimeCodeCell_Previews: PreviewProvider {
    static var previews: some View {
        TimeCodeCell(minutes: "10")
    }
}

