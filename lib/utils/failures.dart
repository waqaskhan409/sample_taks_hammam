import 'dart:convert';

class Failure {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class UnRecognizedFailure extends Failure {
  // 'An unrecognized error has occured. Please check your internet connection and try again!'
  UnRecognizedFailure() : super("unrecognized_failure");
}

class ConnectivityFailure extends Failure {
  // "You seem to be offline or your internet connection is unstable. Please check your connection and try again!"
  ConnectivityFailure() : super("connectivity_failure");
}

class DuplicateIdFoundFailure extends Failure {
  DuplicateIdFoundFailure() : super("Record already exist");
}

class IdNotFoundFailure extends Failure {
  IdNotFoundFailure() : super("Record not found");
}

class ResponseFailure extends Failure {
  ResponseFailure._(String message) : super(message);

  factory ResponseFailure.fromJson(Map<String, dynamic> json) {
    String message = '';

    for (MapEntry entry in json.entries) {
      if (entry.value is List) {
        final joinedMessages = (entry.value as List).join('\n');
        message += joinedMessages;
      }
    }
    message = utf8.decode(message.codeUnits);
    return ResponseFailure._(message);
  }
}
