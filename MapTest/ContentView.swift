//
//  ContentView.swift
//  MapTest
//
//  Created by Jacek Kosiński G on 09/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var locations = LocationViewModel.sampleLocations
    
    @State private var searchText = ""
    
    var groupedLocations: [String: [Location]] {
        Dictionary(grouping: filteredLocations, by: { $0.country })
    }
    
    var filteredLocations: [Location] {
        if searchText.isEmpty {
            return locations
        } else {
            return locations.filter { location in
                location.name.lowercased().contains(searchText.lowercased()) ||
                location.address.lowercased().contains(searchText.lowercased()) ||
                location.country.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchText)
                    .padding(7)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal)
                
                List {
                    ForEach(groupedLocations.keys.sorted(), id: \.self) { key in
                        Section(header: Text(key).font(.headline)) {
                            ForEach(groupedLocations[key]!, id: \.id) { location in
                                NavigationLink(destination: DetailView(location: location)) {
                                    HStack {
                                        Text(location.flagEmoji)
                                        VStack(alignment: .leading, spacing: 5) {
                                            Text(location.name)
                                                .font(.headline)
                                            Text(location.address)
                                                .font(.footnote)
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                .listStyle(GroupedListStyle())
            }
            .navigationBarTitle("Locations")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
