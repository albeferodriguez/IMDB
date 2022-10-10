//
//  ItemWithText.swift
//  imdb
//
//  Created by Alberto Fernandez-Baillo Rodriguez on 10/10/22.
//

import SwiftUI

struct ItemWithText: View {

    var icon: String
    var typeName: String
    var itemText: String

    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(typeName)
                .font(.subheadline)
            Spacer()
            if let type = itemText {
                Text(type)
                    .padding(.trailing, 20)
                    .font(.subheadline)
            }
        }
        .padding()
        .overlay(
            Capsule()
                .stroke(.black, lineWidth: 1)
        )
        .padding(.leading, 20)
        .padding(.trailing, -20)
        .frame(maxWidth: .infinity, maxHeight: 60)
        .ignoresSafeArea(.container, edges: .trailing)
    }
}

struct ItemWithText_Previews: PreviewProvider {
    static var previews: some View {
        ItemWithText(icon: "fire", typeName: "Type", itemText: "")
    }
}
