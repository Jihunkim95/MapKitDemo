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

struct ContentView: View {
    
    // 검색 결과 업데이트
    @State private var position: MapCameraPosition = .automatic
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
                    SearchButtons(searchResults: $searchResults)
                        .padding(.top)
                    Spacer()
                }
            }
            .background(.thinMaterial)
        }
        .onChange(of: searchResults){
            position = .automatic
        }
        
    }
}

#Preview {
    ContentView()
}
