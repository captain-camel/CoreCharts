//
//  ReadSize.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

extension View {
    /// Updates a `Binding` with the size of a view when it changes.
    @ViewBuilder func readSize(_ size: Binding<CGSize>) -> some View {
        self
            .background(SizeReader(size: size))
    }
}

/// A view with a binding to its own size.
struct SizeReader: View {
    // MARK: Properties
    /// The size of the view.
    @Binding var size: CGSize
    
    // MARK: Body
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .onAppear {
                    DispatchQueue.main.async {
                        size = geometry.size.rounded()
                    }
                }
                .onChange(of: geometry.size) { _ in
                    DispatchQueue.main.async {
                        size = geometry.size.rounded()
                    }
                }
        }
    }
}
