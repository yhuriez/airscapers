


import 'package:airscaper/builder/configuration/logger.dart';
import 'package:airscaper/common/ars_result.dart';
import 'package:dio/dio.dart';

const NOT_CONNECTED = "NOT_CONNECTED";
const FORBIDDEN = "FORBIDDEN";
const BAD_REQUEST = "BAD_REQUEST";
const SERVER_ERROR = "SERVER_ERROR";
const UNKNOWN_ERROR = "UNKNOWN_ERROR";


ARSResult<T> managedResponse<T>(Response response, T Function() onSuccess) {
  var statusCode = response.statusCode;
  if(statusCode >= 200 && statusCode <= 299) {
    return ARSResult.success(onSuccess());
  } else {
    logger.w("** Received error message : $response");
    return ARSResult.error(getErrorCodeFromStatusCode(statusCode));
  }
}


String getErrorCodeFromStatusCode(int statusCode) {
  if(statusCode == 400) return BAD_REQUEST;
  if(statusCode == 401) return NOT_CONNECTED;
  if(statusCode == 403) return FORBIDDEN;
  if(statusCode >= 500) return SERVER_ERROR;
  return UNKNOWN_ERROR;
}