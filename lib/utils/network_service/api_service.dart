library api_service;

import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:gestapo/utils/network_service/core/common_values.dart';
import 'package:gestapo/utils/network_service/core/enum.dart';
import 'package:gestapo/utils/network_service/core/typedef.dart';
import 'package:gestapo/utils/network_service/models/api_request.dart';
import 'package:gestapo/utils/network_service/models/multipart_filedata.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static ApiService? _instance;

  ApiService._internal();

  static ApiService get instance {
    _instance ??= ApiService._internal();
    return _instance!;
  }

  /// This method is the starting point of the API call.
  Future<ApiResponse> call({required ApiRequest request}) async {
    final completer = Completer<ApiResponse>();
    await _processRequest(request, completer);
    return completer.future;
  }

  /// [_processRequest] is used to call the API based to given request and [_queue].
  Future<void> _processRequest(
    ApiRequest request,
    Completer<ApiResponse> completer,
  ) async {
    // set headers
    if (request.headers != null) {
      request.headers!.addAll(await CommonValues.headers());
    } else {
      request.headers = <String, String>{};
      request.headers?.addAll(await CommonValues.headers());
    }
    log("${request.url} | Headers | ${json.encode(request.headers)}");

    // set body
    if (request.body != null) {
      request.body!.addAll(await CommonValues.body());
    }

    log("${request.url} | Body | ${json.encode(request.body)}");

    try {
      switch (request.method) {
        case Method.get:
          http.Response response = await http.get(
            Uri.parse(request.url),
            headers: request.headers,
          );
          await evaluateResponse(
            response: response,
            request: request,
            completer: completer,
          );
          break;
        case Method.post:
          http.Response response = await http.post(
            Uri.parse(request.url),
            headers: request.headers,
            body: request.body,
          );
          await evaluateResponse(
            response: response,
            request: request,
            completer: completer,
          );
          break;
        case Method.multipart:
          http.MultipartRequest multipartRequest =
              http.MultipartRequest("POST", Uri.parse(request.url));

          for (MultipartFileDataModel file in request.fileData ?? []) {
            multipartRequest.files.add(
              await http.MultipartFile.fromPath(
                file.parameterName,
                file.filePath,
              ),
            );
          }

          for (var entry in request.body!.entries) {
            multipartRequest.fields[entry.key] = entry.value;
          }

          multipartRequest.headers.addAll(request.headers ?? {});
          http.StreamedResponse streamedResponse =
              await multipartRequest.send();
          http.Response response =
              await http.Response.fromStream(streamedResponse);
          await evaluateResponse(
            response: response,
            request: request,
            completer: completer,
          );
          break;
        default:
          http.Response response = await http.post(
            Uri.parse(request.url),
            headers: request.headers,
            body: request.body,
          );
          await evaluateResponse(
            response: response,
            request: request,
            completer: completer,
          );
      }
    } catch (e, stacktrace) {
      log('API call failed: $e with \n Stacktrace ${stacktrace.toString()}');
      _onError(request);
    }
  }

  // This method is used to check whether the API response is correct or not based on the statusCode and the response body.
  Future<void> evaluateResponse({
    required http.Response response,
    required ApiRequest request,
    required Completer<ApiResponse> completer,
  }) async {
    ApiResponse responseMap;

    log("${request.url} | Status Code | ${response.statusCode}");

    try {
      log("${request.url} | Response | ${response.body}");
      responseMap = json.decode((response.body));
    } catch (e) {
      log("Response json.decode error: $e");
    }

    switch (response.statusCode) {
      case 200:
        break;

      case 500:
        log('API call failed because of getting ${response.statusCode} status code in Response.');
        await _onError(request);
        break;

      default:
    }

    if (!completer.isCompleted) {
      completer.complete(responseMap);
    }
  }

  Future<void> _onError(ApiRequest request, {ApiResponse? response}) async {}
}
