//
//  ContentView.swift
//  where-am-i
//
//  Created by Saverio Ferrara on 8/14/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()

    var body: some View {
        VStack {
            if let location = locationManager.location {
                Text("Your Location")
                    .font(.title)
                    .padding()

                Text("Latitude: \(location.coordinate.latitude)")
                Text("Longitude: \(location.coordinate.longitude)")

                if let placemark = locationManager.placemark {
                    Text("Country: \(placemark.country ?? "N/A")")
                    Text("Region: \(placemark.administrativeArea ?? "N/A")")
                    Text("Locality: \(placemark.locality ?? "N/A")")
                    Text("SubLocality: \(placemark.subLocality ?? "N/A")")
                    Text("Thoroughfare: \(placemark.thoroughfare ?? "N/A")")
                    Text("SubThoroughfare: \(placemark.subThoroughfare ?? "N/A")")
                    Text("Postal Code: \(placemark.postalCode ?? "N/A")")
                }
            } else {
                if locationManager.authorizationStatus == .notDetermined {
                    Button("Request Location Permission") {
                        locationManager.requestPermission()
                    }
                } else if locationManager.authorizationStatus == .denied || locationManager.authorizationStatus == .restricted {
                    Text("Location access was denied or restricted. Please enable it in Settings.")
                } else {
                    Text("Fetching location...")
                }
            }
        }
        .onAppear {
            locationManager.startUpdatingLocationIfAuthorized()
        }
    }
}

#Preview {
    ContentView()
}
