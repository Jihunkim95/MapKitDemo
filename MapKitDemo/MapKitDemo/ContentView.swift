//
//  ContentView.swift
//  MapKitDemo
//
//  Created by 김지훈 on 2024/01/02.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let home = CLLocationCoordinate2D(latitude: 37.65, longitude: 127.0739)
}

struct ContentView: View {
    var body: some View {
        VStack {
            Map{
                Marker("민정이 집", coordinate: .home)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
