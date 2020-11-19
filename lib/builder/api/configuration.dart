import 'dart:convert';

import 'package:airscaper/common/ars_result.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const LOCALHOST_BASE_URL = "http://localhost:3000";
const CURRENT_VERSION = "v1";

const BASE_URL = "$LOCALHOST_BASE_URL/$CURRENT_VERSION";

var _dioInstance;

Dio get dio {
  if (_dioInstance == null) {
    _dioInstance = Dio(BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: 40000,
        receiveTimeout: 30000,
        contentType: "application/json"));

    (_dioInstance.transformer as DefaultTransformer).jsonDecodeCallback =
        parseJson;
    dio.interceptors.add(PrettyDioLogger());
  }
  return _dioInstance;
}



_parseDecodeJson(String response) => jsonDecode(response);

parseJson(String response) => compute(_parseDecodeJson, response);