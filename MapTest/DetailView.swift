//
//  DetailView.swift
//  MapTest
//
//  Created by Jacek Kosiński G on 09/04/2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct DetailView: View {
    let location: Location
    @State private var coordinate: CLLocationCoordinate2D?
    
    var body: some View {
        TabView {
            VStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(location.flagEmoji + " " + location.country)
                        .font(.title)
                    Text(location.name)
                        .font(.title2)
                    Text(location.address)
                        .font(.body)
                    Text(location.description)
                        .font(.body)
                        .padding(.top)
                }
                .padding()
                
                if let coordinate = coordinate {
                    Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))))
                        .frame(height: 300)
                        .edgesIgnoringSafeArea(.bottom)
                }
            }
            .tabItem {
                Label("Info & Map", systemImage: "info.circle")
            }
            
            if let coordinate = coordinate {
                MapDetailView(coordinate: coordinate)
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
            }
            
            if let coordinate = coordinate {
                TurnAroundView(coordinate: coordinate)
                    .tabItem {
                        Label("Turnaround", systemImage: "arrow.triangle.2.circlepath")
                    }
            }
        }
        .onAppear {
            getCoordinate(from: location.address) { coordinate in
                self.coordinate = coordinate
            }
        }
        .navigationBarTitle(location.name, displayMode: .inline)
    }
    
    private func getCoordinate(from address: String, completion: @escaping (CLLocationCoordinate2D?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            guard let placemark = placemarks?.first, let location = placemark.location else {
                completion(nil)
                return
            }
            completion(location.coordinate)
        }
    }
}



struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(location:  LocationViewModel.sampleLocations.randomElement()!)
    }
}
