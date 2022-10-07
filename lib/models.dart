class Coordinates {
  double latitude = 0;
  double longitude = 0;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });
}

class GeocoderResponse {
  List<GeocoderResult> results = [];
  List<String> establishment = [];
  List<String> plusCode = [];
  List<String> premise = [];
  List<String> subLocalityLevel1 = [];
  List<String> subLocalityLevel2 = [];
  List<String> subLocality = [];
  List<String> locality = [];
  List<String> administrativeAreas1 = [];
  List<String> administrativeAreas2 = [];
  List<String> countries = [];
  List<String> postalCodes = [];

  GeocoderResponse.fromJson(Map<String, dynamic> json) {
    for (var element in json['results']) {
      results.add(GeocoderResult.fromJson(element));
    }

    // Parsed Responses
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('establishment')) {
          if (!establishment.contains(element.longName)) {
            establishment.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('plus_code')) {
          if (!plusCode.contains(element.longName)) {
            plusCode.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('premise')) {
          if (!premise.contains(element.longName)) {
            premise.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('sublocality_level_1')) {
          if (!subLocalityLevel1.contains(element.longName)) {
            subLocalityLevel1.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('sublocality_level_2')) {
          if (!subLocalityLevel2.contains(element.longName)) {
            subLocalityLevel2.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('sublocality')) {
          if (!subLocality.contains(element.longName)) {
            subLocality.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('locality')) {
          if (!locality.contains(element.longName)) {
            locality.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('administrative_area_level_1')) {
          if (!administrativeAreas1.contains(element.longName)) {
            administrativeAreas1.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('administrative_area_level_2')) {
          if (!administrativeAreas2.contains(element.longName)) {
            administrativeAreas2.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('country')) {
          if (!countries.contains(element.longName)) {
            countries.add(element.longName);
          }
        }
      }
    }
    for (var components in results) {
      for (var element in components.addressComponents) {
        if (element.types.contains('postal_code')) {
          if (!postalCodes.contains(element.longName)) {
            postalCodes.add(element.longName);
          }
        }
      }
    }
  }
}

class GeocoderResult {
  List<GeocoderAddressComponent> addressComponents = [];
  String formattedAddress = '';
  GeocoderGeometry geometry = GeocoderGeometry();
  String placeId = '';

  GeocoderResult.fromJson(Map<String, dynamic> json) {
    for (var element in json['address_components']) {
      addressComponents.add(
        GeocoderAddressComponent.fromJson(element),
      );
    }
    formattedAddress = json['formatted_address'].toString();
    geometry = GeocoderGeometry.fromJson(json['geometry']);
    placeId = json['place_id'].toString();
  }
}

class GeocoderAddressComponent {
  String longName = '';
  String shortName = '';
  List<String> types = [];

  GeocoderAddressComponent.fromJson(Map<String, dynamic> json) {
    longName = json['long_name'].toString();
    shortName = json['short_name'].toString();
    types = List.from(json['types']);
  }
}

class GeocoderGeometry {
  GeocoderBounds bounds = GeocoderBounds();
  Coordinates location = Coordinates(latitude: 0, longitude: 0);
  String locationType = '';
  GeocoderBounds viewport = GeocoderBounds();

  GeocoderGeometry();

  GeocoderGeometry.fromJson(Map<String, dynamic> json) {
    if (json['bounds'] != null) {
      bounds = GeocoderBounds.fromJson(json['bounds']);
    }
    location = Coordinates(
      latitude: double.parse(json['location']['lat'].toString()),
      longitude: double.parse(json['location']['lng'].toString()),
    );
    locationType = json['location_type'].toString();
    viewport = GeocoderBounds.fromJson(json['viewport']);
  }
}

class GeocoderBounds {
  Coordinates northeast = Coordinates(latitude: 0, longitude: 0);
  Coordinates southwest = Coordinates(latitude: 0, longitude: 0);

  GeocoderBounds();

  GeocoderBounds.fromJson(Map<String, dynamic> json) {
    northeast = Coordinates(
      latitude: double.parse(json['northeast']['lat'].toString()),
      longitude: double.parse(json['northeast']['lng'].toString()),
    );
    southwest = Coordinates(
      latitude: double.parse(json['southwest']['lat'].toString()),
      longitude: double.parse(json['southwest']['lng'].toString()),
    );
  }
}
