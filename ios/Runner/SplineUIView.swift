//
//  SplineUIView.swift
//  Runner
//
//  Created by Aidar Maratbekov on 25.02.2025.
//

import SplineRuntime
import SwiftUI


struct SplineUIView: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/2pUA25Hyuvmcm2xdY9zr/scene.splineswift")!

        // fetching from local
        // let url = Bundle.main.url(forResource: "scene", withExtension: "splineswift")!

        SplineView(sceneFileURL: url)
            .ignoresSafeArea(.all)
            .background(Color.clear)
//            .blendMode(.destinationOver)
    }
}

struct SplineUIView_Previews: PreviewProvider {
    static var previews: some View {
        SplineUIView()
    }
}
