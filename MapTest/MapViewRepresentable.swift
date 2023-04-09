//
//  MapViewRepresentable.swift
//  MapTest
//
//  Created by Jacek Kosiński G on 09/04/2023.
//

import Foundation
import MapKit
import SwiftUI
import UIKit


struct MapViewRepresentable: UIViewRepresentable {
    var coordinate: CLLocationCoordinate2D
    var completion: ((MKLookAroundSceneRequest) -> Void)?
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.setRegion(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)), animated: true)
        
        let request = MKLookAroundSceneRequest(coordinate: coordinate)
        
        
            // Call the completion handler with the request
        completion?(request)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewRepresentable
        
        init(_ parent: MapViewRepresentable) {
            self.parent = parent
        }
    }
}

