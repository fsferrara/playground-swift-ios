import SwiftUI
import CoreLocation

struct CurrentLocationView: View {
    @StateObject private var viewModel: CurrentLocationViewModel

    init(viewModel: CurrentLocationViewModel? = nil) {
        _viewModel = StateObject(wrappedValue: viewModel ?? CurrentLocationViewModel())
    }

    var body: some View {
        VStack {
            if let location = viewModel.location {
                Text("Your Location")
                    .font(.title)
                    .padding()

                Text("Latitude: \(location.coordinate.latitude)")
                Text("Longitude: \(location.coordinate.longitude)")

                if let placemark = viewModel.placemark {
                    Text("Country: \(placemark.country ?? "N/A")")
                    Text("Region: \(placemark.administrativeArea ?? "N/A")")
                    Text("Locality: \(placemark.locality ?? "N/A")")
                    Text("SubLocality: \(placemark.subLocality ?? "N/A")")
                    Text("Thoroughfare: \(placemark.thoroughfare ?? "N/A")")
                    Text("SubThoroughfare: \(placemark.subThoroughfare ?? "N/A")")
                    Text("Postal Code: \(placemark.postalCode ?? "N/A")")
                }
            }
            // Add a button to refresh location
            Button("Refresh Location") {
                viewModel.fetchCurrentLocation()
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .controlSize(.large)
        }
    }
}

#Preview {
    return CurrentLocationView()
}
