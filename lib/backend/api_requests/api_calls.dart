import 'dart:convert';
import 'package:actdata/main.dart';
import 'package:dio/dio.dart';
import 'package:scope_function/scope_function.dart';

import 'api_manager.dart';
export 'api_manager.dart' show ApiCallResponse;

final dioClient = Dio(
  BaseOptions(
    baseUrl: "",
    connectTimeout: 30000,
    receiveTimeout: 3000,
  ),
).also((it) {
  it.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      // Add the access token to the request header
      options.headers['Content-Type'] = 'application/json';
      options.headers['apikey'] = '';

      return handler.next(options);
    },
    onResponse: (e, handler) async {
      if (e.data["status"] == 401) {
        // If a 401 response is received, refresh the access token
        await ApiManager.refresh(it);

        // Update the request header with the new access token
        Map<String, dynamic> temp = jsonDecode(e.requestOptions.data);
        temp['token'] = ffAppState.userAuthToken;
        e.requestOptions.data = temp;

        // Repeat the request with the updated header
        return handler.resolve(await it.fetch(e.requestOptions));
      }

      return handler.next(e);
    },
  ));
});

class SignInCall {
  static Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) {
    final body = '''
    {
      "email": "$email",
      "password": "$password"
    }''';

    return ApiManager.instance.makeApiCall(
      apiPath: '/auth/signIn',
      callType: ApiCallType.POST,
      params: {},
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
      dioClient: dioClient,
    );
  }
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
