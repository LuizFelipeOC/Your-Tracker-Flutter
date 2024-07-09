import 'package:result_dart/result_dart.dart';
import 'package:uno/uno.dart';
import 'package:your_tracker/app/services/client/client.dart';
import 'package:your_tracker/app/services/client/result.dart';
import 'package:your_tracker/app/shared/app_url.dart';

class UnoClient implements IClient {
  final Uno uno;
  final AppUrl appUrl;

  UnoClient({required this.uno, required this.appUrl});

  @override
  AsyncResult<SuccessResponse, FailureResponse> get({required Map<String, String> params}) async {
    try {
      final response = await uno.get(
        '${appUrl.url}&codigo=${params['codigo']}',
        headers: {'content-type': 'application/json'},
      );

      return Success(SuccessResponse(data: response.data));
    } on UnoError catch (unoError) {
      return Failure(
        FailureResponse(message: unoError.message, statusCode: unoError.response?.status),
      );
    } catch (_) {
      return Failure(FailureResponse(message: _.toString()));
    }
  }
}
