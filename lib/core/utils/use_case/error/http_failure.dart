part of 'http_error_catcher.dart';

abstract class HttpFailure extends Failure {
  HttpFailure(String message) : super(message);
}

class BadRequest extends HttpFailure {
  BadRequest() : super("Request failed, probably has some invalid data");
}

class Unauthorized extends HttpFailure {
  Unauthorized() : super("User unauthorized, please login first");
}

class Forbidden extends HttpFailure {
  Forbidden() : super("You shouldn't access this part of feature");
}

class MethodNotAllowed extends HttpFailure {
  MethodNotAllowed() : super("Your method not allowed");
}

class RequestTimeout extends HttpFailure {
  RequestTimeout() : super("The server timed out waiting for the request");
}

class PayloadTooLarge extends HttpFailure {
  PayloadTooLarge()
      : super(
            "The request is larger than the server is willing or able to process");
}

class ServiceUnavailable extends HttpFailure {
  ServiceUnavailable()
      : super(
            "The server cannot handle the request (because it is overloaded or down for maintenance)");
}

class InvalidError extends HttpFailure {
  InvalidError() : super("Invalid Record Data or Validation Data");
}

class ClientError extends HttpFailure {
  ClientError(int code) : super("Something error in client side with $code");
}

class ServerError extends HttpFailure {
  ServerError(int code) : super("Something error in server side with $code");
}

class ConnectTimeout extends HttpFailure {
  ConnectTimeout(int timeout)
      : super("Connect Timeout. Max timeout = $timeout");
}

class ReceiveTimeout extends HttpFailure {
  ReceiveTimeout(int timeout)
      : super("Receive Timeout. Max timeout = $timeout");
}

class SendTimeout extends HttpFailure {
  SendTimeout(int timeout) : super("Send Timeout. Max timeout = $timeout");
}

class MessageError extends HttpFailure {
  MessageError(String message) : super(message);
}

class HttpOtherError extends HttpFailure {
  HttpOtherError(String message)
      : super("Something error. Probably because VPN was off.\n\n$message");
}
