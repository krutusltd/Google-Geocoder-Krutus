class Coordinates {
  double latitude = 0;
  double longitude = 0;

  Coordinates({
    required this.latitude,
    required this.longitude,
  });
}

class GeocoderResponse {
  // List<String> plusCode = [];
  List<GeocoderResult> results = [];

  GeocoderResponse.fromJson(Map<String, dynamic> json) {
    for (var element in json['results']) {
      results.add(GeocoderResult.fromJson(element));
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
      longitude: double.parse(json['location']['lat'].toString()),
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
