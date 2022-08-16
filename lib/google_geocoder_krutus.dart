library google_geocoder_krutus;

import 'dart:convert';
import 'package:google_geocoder_krutus/models.dart';
import 'package:http/http.dart' as http;

class GoogleGeocoderKrutus {
  static Future<GeocoderResponse?> reverseGeoCode({
    required String apiKey,
    required Coordinates coordinates,
    String language = 'en',
  }) async {
    try {
      Uri url = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/geocode/json',
        queryParameters: {
          'latlng': '${coordinates.latitude},${coordinates.longitude}',
          'key': apiKey,
          'language': language,
        },
      );
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data.containsKey('error_message')) {
          throw data['error_message'];
        } else {
          GeocoderResponse googleData = GeocoderResponse.fromJson(data);
          return googleData;
        }
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  static Future<GeocoderResponse?> addressQuery({
    required String apiKey,
    required String address,
    String language = 'en',
  }) async {
    try {
      Uri url = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/geocode/json',
        queryParameters: {
          'address': address,
          'key': apiKey,
          'language': language,
        },
      );
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data.containsKey('error_message')) {
          throw data['error_message'];
        } else {
          GeocoderResponse googleData = GeocoderResponse.fromJson(data);
          return googleData;
        }
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  static Future<GeocoderResponse?> placeID({
    required String apiKey,
    required String placeId,
    String language = 'en',
  }) async {
    try {
      Uri url = Uri(
        scheme: 'https',
        host: 'maps.googleapis.com',
        path: 'maps/api/geocode/json',
        queryParameters: {
          'place_id': placeId,
          'key': apiKey,
          'language': language,
        },
      );
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data.containsKey('error_message')) {
          throw data['error_message'];
        } else {
          GeocoderResponse googleData = GeocoderResponse.fromJson(data);
          return googleData;
        }
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
