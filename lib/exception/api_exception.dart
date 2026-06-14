abstract class ApiException implements Exception {
  final String message;
  final int? statusCode;

  ApiException(this.message, {this.statusCode});

  @override
  String toString() {
    return statusCode == null ? message : '[$statusCode] $message';
  }
}

class BadRequestException extends ApiException {
  BadRequestException(super.message, {super.statusCode = 400});
}

class NotFoundException extends ApiException {
  NotFoundException(super.message, {super.statusCode = 404});
}

class ServerErrorException extends ApiException {
  ServerErrorException(super.message, {super.statusCode = 500});
}

class UnknownApiException extends ApiException {
  UnknownApiException(super.message);
}
