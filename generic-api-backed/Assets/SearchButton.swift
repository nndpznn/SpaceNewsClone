//
//  SearchButton.swift
//  generic-api-backed
//
//  Created by Nolan Nguyen on 2/19/24.
//

import SwiftUI

struct SearchButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("", systemImage: isSet ?"magnifyingglass.circle" : "magnifyingglass.circle.fill")
            .imageScale(.large)
            .labelStyle(.iconOnly)
            .rotationEffect(.degrees(isSet ? 360 : 0))
            .animation(.easeInOut, value: isSet)
        }
    }
}

#Preview {
    SearchButton(isSet: .constant(false))
}
