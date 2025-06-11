//
//  AsyncImageCircle.swift
//  GreenThumb
//
//  Created by Sergio Altuzar on 10/06/25.
//

import SwiftUI

struct AsyncImageCircle: View {
    let imageURL: URL

    var body: some View {
        AsyncImage(url: imageURL) { image in
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green.opacity(0.3), Color.blue.opacity(0.3)]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 85, height: 85)
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)

                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
            }
        } placeholder: {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray.opacity(0.1)]),
                            center: .center,
                            startRadius: 10,
                            endRadius: 40
                        )
                    )
                    .frame(width: 85, height: 85)
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)

                ProgressView()
                    .scaleEffect(1.2)
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            }
        }
    }
}
