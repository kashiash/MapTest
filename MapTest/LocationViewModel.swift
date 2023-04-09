//
//  LocationViewModel.swift
//  MapTest
//
//  Created by Jacek Kosiński G on 09/04/2023.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation


class LocationViewModel: ObservableObject {
    @Published var coordinate: CLLocationCoordinate2D?
    
    func geocode(address: String) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { (placemarks, error) in
            if let error = error {
                print("Error geocoding address: \(error.localizedDescription)")
                return
            }
            
            if let placemark = placemarks?.first, let location = placemark.location {
                DispatchQueue.main.async {
                    self.coordinate = location.coordinate
                }
            }
        }
    }
    
    
    static let sampleLocations = [
        Location(name: "Statue of Liberty", description: "An iconic symbol of freedom", address: "Statue of Liberty, New York, NY 10004, USA", country: "United States", flagEmoji: "🇺🇸"),
        Location(name: "Eiffel Tower", description: "Parisian landmark", address: "Champ de Mars, 5 Avenue Anatole France, 75007 Paris, France", country: "France", flagEmoji: "🇫🇷"),
        Location(name: "Colosseum", description: "Ancient Roman landmark", address: "Piazza del Colosseo, 1, 00184 Roma RM, Italy", country: "Italy", flagEmoji: "🇮🇹"),
        Location(name: "Big Ben", description: "Famous clock tower", address: "Westminster, London SW1A 0AA, UK", country: "United Kingdom", flagEmoji: "🇬🇧"),
        Location(name: "Great Wall of China", description: "Historic fortification", address: "Huairou District, China", country: "China", flagEmoji: "🇨🇳"),
        Location(name: "Sydney Opera House", description: "Iconic performing arts venue", address: "Bennelong Point, Sydney NSW 2000, Australia", country: "Australia", flagEmoji: "🇦🇺"),
        Location(name: "Mount Fuji", description: "Japan's highest mountain", address: "Mount Fuji, Kitayama, Fujinomiya, Shizuoka, Japan", country: "Japan", flagEmoji: "🇯🇵"),
        Location(name: "Christ the Redeemer", description: "Iconic statue in Rio de Janeiro", address: "Parque Nacional da Tijuca, Alto da Boa Vista, Rio de Janeiro, RJ, Brazil", country: "Brazil", flagEmoji: "🇧🇷"),
        Location(name: "Taj Mahal", description: "Iconic mausoleum", address: "Dharmapuri, Forest Colony, Tajganj, Agra, Uttar Pradesh 282001, India", country: "India", flagEmoji: "🇮🇳"),
        Location(name: "Machu Picchu", description: "Incan citadel", address: "Machu Picchu, Cusco, Peru", country: "Peru", flagEmoji: "🇵🇪"),
        Location(name: "Niagara Falls", description: "Majestic waterfalls", address: "Niagara Falls, Ontario, Canada", country: "Canada", flagEmoji: "🇨🇦"),
        Location(name: "Pyramids of Giza", description: "Ancient Egyptian pyramids", address: "Al Haram, Nazlet El-Semman, Al Giza Desert, Giza Governorate, Egypt", country: "Egypt", flagEmoji: "🇪🇬"),
        Location(name: "Sagrada Família", description: "Antoni Gaudí's basilica", address: "Carrer de Mallorca, 401, 08013 Barcelona, Spain", country: "Spain", flagEmoji: "🇪🇸"),
        Location(name: "Petra", description: "Ancient city carved into rock", address: "Petra, Jordan", country: "Jordan", flagEmoji: "🇯🇴"),
        Location(name: "Angkor Wat", description: "Ancient temple complex", address: "Krong Siem Reap, Cambodia", country: "Cambodia", flagEmoji: "🇰🇭"),
        Location(name: "Table Mountain", description: "Iconic flat-topped mountain", address: "Table Mountain National Park, Cape Town, South Africa", country: "South Africa", flagEmoji: "🇿🇦"),
        Location(name: "Chichen Itza", description: "Ancient Mayan city", address: "Yucatán, Mexico", country: "Mexico", flagEmoji: "🇲🇽"),
        Location(name: "Neuschwanstein Castle", description: "Fairytale-like castle", address: "Neuschwansteinstraße 20, 87645 Schwangau, Germany", country: "Germany", flagEmoji: "🇩🇪"),
        Location(name: "Burj Khalifa", description: "World's tallest building", address: "1 Sheikh Mohammed bin Rashid Blvd, Dubai, United Arab Emirates", country: "United Arab Emirates", flagEmoji: "🇦🇪"),
        Location(name: "Grand Canyon", description: "Vast and scenic canyon", address: "Grand Canyon, Arizona, USA", country: "United States", flagEmoji: "🇺🇸"),
        Location(name: "Galápagos Islands", description: "Unique wildlife and landscapes", address: "Galápagos Islands, Ecuador", country: "Ecuador", flagEmoji: "🇪🇨"),
        Location(name: "Victoria Falls", description: "One of the world's largest waterfalls", address: "Victoria Falls, Zimbabwe", country: "Zimbabwe", flagEmoji: "🇿🇼"),
        
        Location(name: "Silesian Museum", description: "Museum of Silesian history and art", address: "Tadeusza Dobrowolskiego 1, 40-205 Katowice, Poland", country: "Poland", flagEmoji: "🇵🇱"),
        Location(name: "Spodek", description: "Multipurpose arena complex", address: "Aleja Wojciecha Korfantego 35, 40-005 Katowice, Poland", country: "Poland", flagEmoji: "🇵🇱"),
        Location(name: "Guido Mine", description: "Historic coal mine", address: "3 Maja 93, 41-500 Chorzów, Poland", country: "Poland", flagEmoji: "🇵🇱"),
        Location(name: "Park Śląski", description: "Large park and recreation complex", address: "Park Śląski, Chorzów, Poland", country: "Poland", flagEmoji: "🇵🇱"),
        Location(name: "Black Trout Adit", description: "Historic underground tunnel", address: "Wyzwolenia 6, 41-908 Bytom, Poland", country: "Poland", flagEmoji: "🇵🇱"),
        Location(name: "Gliwice Radio Tower", description: "Tallest wooden structure in Europe", address: "Radiowa 1, 44-100 Gliwice, Poland", country: "Poland", flagEmoji: "🇵🇱"),
        Location(name: "Częstochowa Jasna Góra Monastery", description: "Iconic monastery", address: "Jasna Góra, 42-225 Częstochowa, Poland", country: "Poland", flagEmoji: "🇵🇱"),
        Location(name: "Tyskie Brewery", description: "Historic brewery", address: "Mikołowska 5, 43-100 Tychy, Poland", country: "Poland", flagEmoji: "🇵🇱"),
        Location(name: "Silesian Planetarium", description: "Astronomy center", address: "ul. Świerkowa 7, 41-500 Chorzów, Poland", country: "Poland", flagEmoji: "🇵🇱"),
        Location(name: "Museum of Silesian Uprisings", description: "Historical museum", address: "ul. Zamkowa 2, 42-600 Tarnowskie Góry, Poland", country: "Poland", flagEmoji: "🇵🇱")
    
    ]
    
}
