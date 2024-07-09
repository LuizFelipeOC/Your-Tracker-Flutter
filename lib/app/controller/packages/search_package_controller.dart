import 'package:flutter/material.dart';
import 'package:your_tracker/app/controller/packages/search_package_state.dart';
import 'package:your_tracker/app/data/package/search_package/search_package_repository.dart';

class SearchPackageController extends ValueNotifier<SearchPackageState> {
  final SearchPackageRepository searchPackageRepository;

  TextEditingController searchTextController = TextEditingController(text: '');

  SearchPackageController({required this.searchPackageRepository}) : super(IdleSearchPackageState());

  Future<void> search() async {
    value = LoadingSearchingPackageState();

    final result = await searchPackageRepository.get(code: searchTextController.text.trim());

    result.fold((onSuccess) {
      value = SuccessSearchedPackageState(package: onSuccess.package);
    }, (onFailure) {
      if (onFailure.message == 'UNAUTHORIZED') {
        value = UnauthorizedAccessPackgeState();
        return;
      }

      value = ErrorSearchedPackageState(message: onFailure.message);
    });
  }
}
