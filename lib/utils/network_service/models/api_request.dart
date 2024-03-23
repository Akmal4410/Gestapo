import 'package:gestapo/utils/network_service/core/enum.dart';
import 'package:gestapo/utils/network_service/core/typedef.dart';
import 'package:gestapo/utils/network_service/models/multipart_filedata.dart';

class ApiRequest {
  String url;
  final Method method;
  Map<String, String>? headers;
  RequestBody? body;
  final List<MultipartFileDataModel>? fileData;

  ApiRequest({
    required this.url,
    required this.method,
    this.headers,
    this.body,
    this.fileData,
  });
}
