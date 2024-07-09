import 'package:your_tracker/app/data/model%20/package_model.dart';

abstract interface class SearchPackageState {}

class SuccessSearchedPackageState implements SearchPackageState {
  final PackageModel package;

  SuccessSearchedPackageState({required this.package});
}

class ErrorSearchedPackageState implements SearchPackageState {
  String message;

  ErrorSearchedPackageState({required this.message});
}

class LoadingSearchingPackageState implements SearchPackageState {}

class UnauthorizedAccessPackgeState implements SearchPackageState {}

class IdleSearchPackageState implements SearchPackageState {}
