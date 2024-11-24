//
//  GridOverlayView.swift
//  AVCam
//
//  Created by Bee on 11/23/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import SwiftUI

struct GridOverlayView: View {
    let vlines = 8
    let hlines = 12
    var body: some View {
        GeometryReader { geometry in
            let vBetweenSpace = Int(geometry.size.width / Double(vlines))
            let hBetweenSpace = Int(geometry.size.height / Double(hlines))
            Path { path in
                path.move(to: CGPoint(x: geometry.size.width / 2, y: 0))
                path.addLine(
                    to: CGPoint(
                        x: geometry.size.width / 2,
                        y: geometry.size.height
                    ))
                path.move(to: CGPoint(x: 0, y: geometry.size.height / 2))
                path.addLine(
                    to: CGPoint(
                        x: geometry.size.height, y: geometry.size.height / 2
                    ))
            }
            .stroke(Color.red, lineWidth: 2)
            .overlay {
                Path { path in
                    for i in 1 ... hlines {
                        path.move(to: CGPoint(x: 0, y: i * hBetweenSpace))
                        path.addLine(to: CGPoint(x: 500, y: i * hBetweenSpace))
                    }
                    for i in 1 ... vlines {
                        path.move(to: CGPoint(x: i * vBetweenSpace, y: 10))
                        path.addLine(to: CGPoint(x: i * vBetweenSpace, y: 700))
                    }
                }
                .stroke(Color.red, lineWidth: 0.5)
            }
        }
    }
}

#Preview {
    GridOverlayView()
}
