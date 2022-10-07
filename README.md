<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
# Update for this release
Added Support for data in the core result. Get all data in their type formatted from every `addressComponents` from every `results` data.

- establishment
- plusCode
- premise
- subLocalityLevel1
- subLocalityLevel2
- subLocality
- locality
- administrativeAreas1
- administrativeAreas2
- countries
- postalCodes

Eg:
```
print(addresses!.establishment);
```

## Description
A flutter plugin to Geocode or Reverse Geocode your coordinates or address strings using Google Maps Geocoder API.

## Features
#### Forward Geocoding
Converting Street or Address String into relevent Address Data using Google Maps Geocoder API.

#### Reverse Geocoding
Converting Coordinates into relevant Address Data using Google Maps Geocoder API.

#### Place ID Geocoding
Converting Place ID into relevant Address Data using Google Maps Geocoder API.

## Usage

Import `package:google_geocoder_krutus/google_geocoder_krutus.dart`, and use the GoogleGeocoderKrutus to access geocoding services provided by the device system.

Example:

```dart
package:google_geocoder_krutus/google_geocoder_krutus.dart

GeocoderResponse? reverseGeocode = await GoogleGeocoderKrutus.reverseGeoCode(
    apiKey: '<GOOGLE MAPS API KEY>',
    coordinates: Coordinates(latitude: 0, longitude: 0),
);

GeocoderResponse? addressQuery = await GoogleGeocoderKrutus.addressQuery(
    apiKey: '<GOOGLE MAPS API KEY>',
    address: '<ADDRESS STRING TO QUERY>',
);

GeocoderResponse? placeID = await GoogleGeocoderKrutus.placeID(
    apiKey: '<GOOGLE MAPS API KEY>',
    placeId: '<PLACE ID TO QUERY>',
);
```
