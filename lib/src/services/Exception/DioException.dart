import 'package:dio/dio.dart';

class DioException implements Exception {
  late String errorMessage;

  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        errorMessage = 'Request to the server was cancelled. Please try again.';
        break;
      case DioErrorType.connectTimeout:
        errorMessage = 'Connection timed out. Please try again.';
        break;
      case DioErrorType.receiveTimeout:
        errorMessage = 'Receiving timeout occurred. Please try again.';
        break;
      case DioErrorType.sendTimeout:
        errorMessage = 'Request send timeout. Please try again.';
        break;
      case DioErrorType.response:
        errorMessage = _handleStatusCode(dioError.response?.statusCode);
        break;
      case DioErrorType.other:
        if (dioError.message.contains('SocketException')) {
          errorMessage = 'No Internet. Please check your connection.';
          break;
        }
        errorMessage = 'Unexpected error occurred. Please try again.';
        break;
      default:
        errorMessage = 'Something went wrong';
        break;
    }
  }

  String _handleStatusCode(int? statusCode) {
    switch (statusCode) {
      case 400:
        return 'Bad request. Contact the developer.';
      case 401:
        return 'Authentication failed. Please check your credentials.';
      case 403:
        return 'The authenticated user is not allowed to access the specified API endpoint.';
      case 404:
        return 'The entered roll number is not registered.';
      case 405:
        return 'Method not allowed. Please check the Allow header for the allowed HTTP methods.';
      case 409:
        return 'Roll numbrer already Registered.';
      case 415:
        return 'Unsupported media type. The requested content type or version number is invalid.';
      case 422:
        return 'Data validation failed. Please contact the developer.';
      case 429:
        return 'Too many requests. Please try again later.';
      case 500:
        return 'Internal server error. Please contact the developer.';
      default:
        return 'Oops something went wrong! Please try again later.';
    }
  }

  @override
  String toString() => errorMessage;
}
