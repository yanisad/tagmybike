import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

List<LatLng> toLatLng(List<dynamic>? jsonResponse) {
  List<LatLng> listLatLon = [];
  // Check if jsonResponse is not null
  if (jsonResponse != null) {
    for (var element in jsonResponse) {
      // Check if 'lat' and 'lon' are present and non-null in the element
      if (element.containsKey('lat') &&
          element['lat'] is num &&
          element.containsKey('lon') &&
          element['lon'] is num) {
        double lat = element['lat'];
        double lon = element['lon'];

        // Add LatLng to the list
        listLatLon.add(LatLng(lat, lon));
      }
    }
  }
  return listLatLon;
}

List<double> tolatlon(LatLng? location) {
  // Transforms a LatLng object into 2 double lat and lon
  if (location != null) {
    return [location.latitude, location.longitude];
  } else {
    return [0.0, 0.0];
  }
}

String? datefr(DateTime datetag) {
  // calculate the number of days between a DateTime and the current date
  DateTime now = DateTime.now();
  Duration difference = now.difference(datetag);
  int days = difference.inDays;
  if (days == 0) {
    return "🚲 déposé aujourd'hui.";
  } else if (days == 1) {
    return "🚲 déposé hier.";
  } else {
    return '🚲 déposé il y a $days jours.';
  }
}

bool timestamp(DateTime? timestampclick) {
  // compare current time and AppState timestamp. Return true if difference > 2 minutes
  if (timestampclick == null) {
    return false;
  }
  DateTime now = DateTime.now();
  Duration difference = now.difference(timestampclick);
  return difference.inMinutes > 2;
}

List<LatLng>? closestPoint(
  LatLng point1,
  List<LatLng> point2,
) {
  // calculate distances from a point to a list of LatLng points and returns the closest point
  double minDist = double.infinity;
  LatLng? closest;
  List<LatLng> result = [];

  for (LatLng point in point2) {
    double lat1 = point1.latitude;
    double lon1 = point1.longitude;
    double lat2 = point.latitude;
    double lon2 = point.longitude;

    double dLat = (lat2 - lat1) * math.pi / 180.0;
    double dLon = (lon2 - lon1) * math.pi / 180.0;

    lat1 = lat1 * math.pi / 180.0;
    lat2 = lat2 * math.pi / 180.0;

    double a = math.pow(math.sin(dLat / 2), 2) +
        math.pow(math.sin(dLon / 2), 2) * math.cos(lat1) * math.cos(lat2);
    double rad = 6371;
    double c = 2 * math.asin(math.sqrt(a));
    double dist = rad * c;

    if (dist < minDist) {
      minDist = dist;
      closest = point;
    }
  }

  if (closest != null) {
    result.add(closest);
  }

  return result;
}

List<LatLng> closestPointsorder(
  LatLng point1,
  List<LatLng> point2,
) {
  // calculate distances from a point to a list of LatLng points and returns the points ordered from closest to farthest
  // calculate distances from a point to a list of LatLng points and returns the points ordered from closest to farthest
  List<List<dynamic>> distances = [];

  for (LatLng point in point2) {
    double lat1 = point1.latitude;
    double lon1 = point1.longitude;
    double lat2 = point.latitude;
    double lon2 = point.longitude;

    double dLat = (lat2 - lat1) * math.pi / 180.0;
    double dLon = (lon2 - lon1) * math.pi / 180.0;

    lat1 = lat1 * math.pi / 180.0;
    lat2 = lat2 * math.pi / 180.0;

    double a = math.pow(math.sin(dLat / 2), 2) +
        math.pow(math.sin(dLon / 2), 2) * math.cos(lat1) * math.cos(lat2);
    double rad = 6371;
    double c = 2 * math.asin(math.sqrt(a));
    double dist = rad * c;

    distances.add([dist, point]);
  }

  // Sort the distances list in ascending order of distance
  distances.sort((a, b) => a[0].compareTo(b[0]));

  // Create a new list of LatLng points ordered from closest to farthest
  List<LatLng> result = distances.map((item) => item[1] as LatLng).toList();

  return result;
}

bool compare(
  LatLng loc1,
  LatLng loc2,
) {
  return (loc1.latitude == loc2.latitude && loc1.longitude == loc2.longitude);
}
