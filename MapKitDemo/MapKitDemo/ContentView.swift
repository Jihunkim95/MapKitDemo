//
//  ContentView.swift
//  MapKitDemo
//
//  Created by 김지훈 on 2024/01/02.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
//    static let home = CLLocationCoordinate2D(latitude: 37.65, longitude: 127.0739)
    static let home = CLLocationCoordinate2D(latitude: 42.354528, longitude: -71.068369)
}
// 도시 해안 좌표
extension MKCoordinateRegion{
    static let boston = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.360256, longitude: -71.057279),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    
    static let northShore = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 42.547408, longitude: -70.870085),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5, longitudeDelta: 0.5)
        )
}
struct ContentView: View {
    
    // 검색 결과 업데이트
    @State private var position: MapCameraPosition = .automatic
    
    //지도에 표시된 지역 추가
    @State private var visibleResion: MKCoordinateRegion?
    
    //장소를 표시할때 사용
    @State private var searchResults: [MKMapItem] = []
    
    var body: some View {
        VStack {
            Map(position: $position){
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
                
                ForEach(searchResults, id: \.self){ result in
                    Marker(item: result)
                }
            }
            //mapStyle 1.
//            .mapStyle(.imagery(elevation: .realistic))
            //mapStyle 2.
            .mapStyle(.standard(elevation: .realistic))
            .safeAreaInset(edge: .bottom){
                HStack {
                    Spacer()
                    SearchButtons(position: $position, searchResults: $searchResults, visibleResion: visibleResion)
                        .padding(.top)
                    Spacer()
                }
            }
            .background(.thinMaterial)
        }
        .onChange(of: searchResults){
            position = .automatic
        }
        // 업데이트 된 내역을 불러옴
        .onMapCameraChange { context in
            visibleResion = context.region
        }
    }
}

#Preview {
    ContentView()
}
