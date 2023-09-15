//
//  ContentView.swift
//  AdmiralCheckControlViewer
//
//  Created by ADyatkov on 15.09.2023.
//

import AdmiralCheckControlSwiftUI
import SwiftUI

struct ContentView: View {

    private let items: [MainItem] = [.radioButton, .checkBox]

    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.id) { item in
                    NavigationLink(destination: getDestinationView(item: item)) {
                        HStack(alignment: .center) {
                            Image(item.imageName)
                                .resizable()
                                .frame(width: 25, height: 25)
                                .cornerRadius(12)
                            VStack(alignment: .leading) {
                                Text(item.title)
                                    .font(.headline)
                                Text(item.subtitle)
                                    .font(.subheadline)
                            }
                            Spacer()
                        }
                    }
                }
            }
        }
        .navigationTitle("Список элементов")
    }

    func getDestinationView(item: MainItem) -> some View {
        switch item {
        case .checkBox:
            return AnyView(CheckBoxSwiftUIView()).navigationTitle(item.title)
        case .radioButton:
            return AnyView(RadioButtonSwiftUIView()).navigationTitle(item.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
