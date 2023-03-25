import CoreLocation

extension CLGeocoder {
    struct Address {
        var prefecture: String?
        var city: String?
        var subLocality: String?
    }

    func convertAddress(from postalCode: String, completion: @escaping (Address?, Error?) -> Void) {
        CLGeocoder().geocodeAddressString(postalCode) { (placemarks, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            if let placemark = placemarks?.first {
                let location = CLLocation(
                    latitude: (placemark.location?.coordinate.latitude)!,
                    longitude: (placemark.location?.coordinate.longitude)!
                )
                 CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
                    guard let placemark = placemarks?.first, error == nil else {
                        completion(nil, error)
                        return
                    }
                    var address: Address = Address()
                    address.prefecture = placemark.administrativeArea
                    address.city = placemark.locality
                    address.subLocality = placemark.subLocality
                    completion(address, nil)
                }
            }
        }
    }
}
