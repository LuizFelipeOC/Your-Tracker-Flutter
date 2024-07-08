class SuccessResponse {
  Map<String, dynamic>? data;

  SuccessResponse({this.data});
}

class FailureResponse {
  String? message;
  int? statusCode;

  FailureResponse({this.message, this.statusCode});
}
