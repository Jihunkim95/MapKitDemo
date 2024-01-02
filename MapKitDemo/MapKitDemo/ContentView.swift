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
                //Maker or Annotation
                Annotation("민정이 집", coordinate: .home){
                    ZStack{
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.background)
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.secondary, lineWidth: 5)
                        Image(systemName: "house")
                            .padding(5)
                    }
                }
                //타이틀 숨기기
//                .annotationTitles(.hidden)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
