import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class OverpassCall {
  static Future<ApiCallResponse> call({
    double? latitude = 52.520008,
    double? longitude = 13.404954,
  }) {
    final body = '''
[out:json];(node["amenity"="bicycle_parking"](around:400,${latitude},${longitude}););out body 30;''';
    return ApiManager.instance.makeApiCall(
      callName: 'overpass',
      apiUrl: 'http://overpass-api.de/api/interpreter',
      callType: ApiCallType.POST,
      headers: {
        'Content-type': 'application/x-www-form-urlencoded',
      },
      params: {},
      body: body,
      bodyType: BodyType.TEXT,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic elements(dynamic response) => getJsonField(
        response,
        r'''$.elements''',
        true,
      );
}

class MapsCall {
  static Future<ApiCallResponse> call({
    String? startCoordinate = '',
    String? destinations = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'maps',
      apiUrl: 'https://maps.googleapis.com/maps/api/distancematrix/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'origins': startCoordinate,
        'destinations': destinations,
        'key': "AIzaSyCpz3p81bxzqWMzURWl2BBqMOe238ry7MA",
        'mode': "walking",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic duration(dynamic response) => getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.text''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
