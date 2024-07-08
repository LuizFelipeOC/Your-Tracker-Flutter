import 'package:result_dart/result_dart.dart';
import 'package:your_tracker/app/data/model%20/package_model.dart';
import 'package:your_tracker/app/data/package/search_package/result.dart';
import 'package:your_tracker/app/services/client/client.dart';

class SearchPackageRepository {
  final IClient client;

  SearchPackageRepository({required this.client});

  AsyncResult<SuccessSearchPackge, FailureSearchPackage> get({required String code}) async {
    final result = await client.get(params: {
      'codigo': code,
    });

    return result.fold((onSuccess) {
      final package = PackageModel.fromJson(onSuccess.data!);

      return Success(SuccessSearchPackge(package: package));
    }, (onError) {
      if (onError.statusCode != null && onError.statusCode == 401) {
        return Failure(FailureSearchPackage(message: 'UNAUTHORIZED'));
      }

      return Failure(FailureSearchPackage(message: onError.message ?? ''));
    });
  }
}
