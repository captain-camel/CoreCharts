//
//  ReadSize.swift
//  
//
//  Created by Cameron Delong on 10/7/21.
//

import SwiftUI

extension View {
    /// Updates a `Binding` when the size of a view changes.
    @ViewBuilder func readWidth(_ size: Binding<CGFloat>) -> some View {
        self
            .background(WidthReader(size: size))
    }
    
    /// Updates a `Binding` when the size of a view changes.
    @ViewBuilder func readHeight(_ size: Binding<CGFloat>) -> some View {
        self
            .background(HeightReader(size: size))
    }
}

/// A view with a binding to its own size.
struct WidthReader: View {
    // MARK: Properties
    /// The size of the view.
    @Binding var size: CGFloat
    
    // MARK: Body
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .onAppear {
                    DispatchQueue.main.async {
                        size = geometry.size.width.rounded()
                    }
                }
                .onChange(of: geometry.size) { _ in
                    DispatchQueue.main.async {
                        size = geometry.size.width.rounded()
                    }
                }
        }
    }
}

/// A view with a binding to its own size.
struct HeightReader: View {
    // MARK: Properties
    /// The size of the view.
    @Binding var size: CGFloat
    
    // MARK: Body
    var body: some View {
        GeometryReader { geometry in
            Color.clear
                .onAppear {
                    DispatchQueue.main.async {
                        size = geometry.size.height.rounded()
                    }
                }
                .onChange(of: geometry.size) { _ in
                    DispatchQueue.main.async {
                        size = geometry.size.height.rounded()
                    }
                }
        }
    }
}
