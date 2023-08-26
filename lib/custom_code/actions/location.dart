// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:permission_handler/permission_handler.dart'; // Import for permissions

Future<void> location(BuildContext context) async {
  // Request location permission. If granted, navigate to "Ajouteruntag"; otherwise, go to "Problem".
  var status = await Permission.location.request();
  if (status == PermissionStatus.granted) {
    Navigator.pushNamed(context, '/Ajouteruntag');
  } else {
    // Handle the case when permission is denied or restricted
    Navigator.pushNamed(context, '/Problem');
  }
}
