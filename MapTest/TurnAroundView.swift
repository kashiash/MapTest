//
//  TurnAroundView.swift
//  MapTest
//
//  Created by Jacek Kosiński G on 09/04/2023.
//

import SwiftUI
import MapKit

struct TurnAroundView: View {
    let coordinate: CLLocationCoordinate2D
    
    var body: some View {
        MapViewRepresentable(coordinate: coordinate) { request in
            print("Look Around Scene Request: \(request)")
        }
        .edgesIgnoringSafeArea(.all)
    }
}


//struct TurnAroundView_Previews: PreviewProvider {
//    static var previews: some View {
//        TurnAroundView()
//    }
//}
