//
//  MapViewControllerRepresentable.swift
//  MapTest
//
//  Created by Jacek Kosiński G on 09/04/2023.
//

import Foundation
import MapKit
import SwiftUI
import UIKit


struct MapViewControllerRepresentable: UIViewControllerRepresentable {
    var coordinate: CLLocationCoordinate2D
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> MKMapViewController {
        let mapViewController = MKMapViewController()
        mapViewController.delegate = context.coordinator
        return mapViewController
    }
    
    func updateUIViewController(_ uiViewController: MKMapViewController, context: Context) {
        uiViewController.centerMap(at: coordinate)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewControllerRepresentable
        
        init(_ parent: MapViewControllerRepresentable) {
            self.parent = parent
        }
    }
}

class MKMapViewController: UIViewController, MKMapViewDelegate {
    private var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView = MKMapView(frame: view.bounds)
        mapView.delegate = self
        view.addSubview(mapView)
    }
    
    func centerMap(at coordinate: CLLocationCoordinate2D) {
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        mapView.setRegion(region, animated: true)
        
        let request = MKLookAroundSceneRequest(coordinate: coordinate)
        
        
            // Present Look Around if available
       // if request.as {
            mapView.showsCompass = false
         //   mapView.showsZoomControls = false
            
            let camera = MKMapCamera(lookingAtCenter: coordinate, fromDistance: 1000, pitch: 75, heading: 0)
            mapView.setCamera(camera, animated: false)
       // }
    }
}

