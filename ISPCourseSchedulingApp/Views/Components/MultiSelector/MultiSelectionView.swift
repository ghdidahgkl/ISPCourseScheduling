//
//  MultiSelectionView.swift
//  TimeMan
// ISPCourseSchedulingApp
//

import SwiftUI

struct MultiSelectionView<Selectable: Identifiable & Hashable>: View {
    let options: [Selectable]
    let optionToString: (Selectable) -> String
    
    @Binding var selected: Set<Selectable>
    
    var body: some View {
        List {
            ForEach(options) { selectable in
                Button {
                    toggleSelection(selectable: selectable)
                } label: {
                    HStack {
                        Text(optionToString(selectable))
                            .foregroundColor(Color("Primary"))
                        Spacer()
                        if selected.contains { $0.id == selectable.id } {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(.accentColor)
                        }
                    }
                }
                .tag(selectable.id)
            }
        }.listStyle(GroupedListStyle())
    }
    
    private func toggleSelection(selectable: Selectable) {
        if let existingIndex = selected.firstIndex(where: { $0.id == selectable.id }) {
            selected.remove(at: existingIndex)
        } else {
            selected.insert(selectable)
        }
    }
}
