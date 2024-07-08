import 'package:result_dart/result_dart.dart';
import 'package:your_tracker/app/services/client/result.dart';

abstract interface class IClient {
  AsyncResult<SuccessResponse, FailureResponse> get({required Map<String, String> params});
}
