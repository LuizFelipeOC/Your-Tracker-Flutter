import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:your_tracker/app/data/package/search_package/search_package_repository.dart';
import 'package:your_tracker/app/services/client/client.dart';
import 'package:your_tracker/app/services/client/result.dart';

import '../../../../helpers/dummies/package_dummy.dart';

class ClientMock extends Mock implements IClient {}

void main() {
  late IClient client;
  late SearchPackageRepository repository;

  setUpAll(() {
    client = ClientMock();
    repository = SearchPackageRepository(client: client);
  });

  tearDownAll(() {
    client = ClientMock();
    repository = SearchPackageRepository(client: client);
  });

  test('Should test when request api returned 401', () async {
    when(() => client.get(params: {'codigo': 'NC823688148BR'})).thenAnswer((_) async {
      return Failure(FailureResponse(message: 'Unauthorized', statusCode: 401));
    });

    final result = await repository.get(code: 'NC823688148BR');

    expect(result.isError(), isTrue);

    result.onFailure((onFailure) {
      expect(onFailure.message, 'UNAUTHORIZED');
    });

    verify(() => client.get(params: {'codigo': 'NC823688148BR'})).called(1);
  });

  test('Should test when api returned success', () async {
    when(() => client.get(params: {'codigo': 'NC823688148BR'})).thenAnswer((_) async {
      return Success(SuccessResponse(data: package));
    });

    final result = await repository.get(code: 'NC823688148BR');

    expect(result.isSuccess(), isTrue);

    result.onSuccess((onSuccess) {
      expect(onSuccess.package.code, 'NC823688148BR');
      expect(onSuccess.package.events, isNotEmpty);
    });

    verify(() => client.get(params: {'codigo': 'NC823688148BR'})).called(1);
  });
}
