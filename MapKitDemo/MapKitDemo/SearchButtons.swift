//
//  BeantownButtons.swift
//  MapKitDemo
//
//  Created by 김지훈 on 2024/01/02.
//

import SwiftUI
import MapKit


struct SearchButtons: View {
    
    @Binding var position: MapCameraPosition
    
    @Binding var searchResults: [MKMapItem]

    var body: some View {
        HStack {
            // 놀이터 검색을 위한 버튼
            Button {
                search(for: "playground")
            } label: {
                Label("Playgrounds", systemImage: "figure.and.child.holdinghands")
            }
            .buttonStyle(.borderedProminent)

            // 해변 검색을 위한 버튼
            Button {
                search(for: "beach")
            } label: {
                Label("Beaches", systemImage: "beach.umbrella")
            }
            .buttonStyle(.borderedProminent)
            
            Button{
                position = .region(.boston)
            } label: {
                Label("Boston", systemImage: "building.2")
            }
            .buttonStyle(.bordered)
            
            Button{
                position = .region(.northShore)
            } label: {
                Label("North Shore", systemImage: "water.waves")
            }
            .buttonStyle(.bordered)
            
            //경사
            Button{
                position = .camera(
                    MapCamera(
                        centerCoordinate: CLLocationCoordinate2D(
                            latitude: 37.65,
                            longitude: 127.0739
                        ),
                        distance: 980,
                        heading: 242,
                        pitch: 60
                    )
                )
            } label: {
                Label("3D Carmera", systemImage: "view.3d")
            }
            .buttonStyle(.bordered)

        }
        .labelStyle(.iconOnly)
    }

    func search(for query: String) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.resultTypes = .pointOfInterest
        request.region = MKCoordinateRegion(
            center: .home, // 이 부분은 유효한 CLLocationCoordinate2D로 교체해야 합니다.
            span: MKCoordinateSpan(latitudeDelta: 0.0125, longitudeDelta: 0.0125)
        )
        Task {
            let search = MKLocalSearch(request: request)
            let response = try? await search.start()
            searchResults = response?.mapItems ?? []
        }
    }
}
