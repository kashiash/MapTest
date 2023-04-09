//
//  MapDetailView.swift
//  MapTest
//
//  Created by Jacek Kosiński G on 09/04/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapDetailView: View {
    @State private var region: MKCoordinateRegion
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
    
    init(coordinate: CLLocationCoordinate2D) {
        self._region = State(initialValue: MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)))
    }
}


//struct MapDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapDetailView(location: LocationViewModel.sampleLocations.randomElement()!)
//    }
//}
