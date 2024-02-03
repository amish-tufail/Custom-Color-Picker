//
//  ContentView.swift
//  CustomColorPicker
//
//  Created by Amish Tufail on 03/02/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var colors: [Color] = [
        .cyan, .yellow, .green, .blue, .red, .orange, .pink, .indigo, .teal, .mint
    ]
    @State private var selectedColor: Color = .cyan
    
    var body: some View {
        NavigationStack {
            HStack {
                RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                    .fill(selectedColor.gradient)
                    .frame(width: 100.0, height: 100.0)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20.0, style: .continuous)
                            .stroke(.black.opacity(0.1), lineWidth: 2.0)
                    }
                    .shadow(color: .black.opacity(0.1), radius: 5.0)
                LazyHGrid(rows: [GridItem(), GridItem()], content: {
                    ForEach(colors, id: \.self) { color in
                        Circle()
                            .foregroundStyle(color.gradient)
                            .opacity(0.8)
                            .frame(width: 40.0, height: 40.0)
                            .scaleEffect(selectedColor == color ? 0.7 : 1.0)
                            .onTapGesture {
                                withAnimation(.snappy) {
                                    selectedColor = color
                                }
                            }
                            .overlay {
                                if selectedColor == color {
                                    Circle()
                                        .stroke(.black, lineWidth: 3.0)
                                }
                            }
                    }
                })
            }
            .frame(height: 100.0)
            .padding()
            .background(selectedColor.opacity(0.1).gradient)
            .clipShape(.rect(cornerRadius: 20.0, style: .continuous))
            .navigationTitle("Color Picker 🎨")
        }
    }
}

#Preview {
    ContentView()
}
