import 'package:your_tracker/app/data/model%20/package_model.dart';

class SuccessSearchPackge {
  final PackageModel package;

  SuccessSearchPackge({required this.package});
}

class FailureSearchPackage {
  final String message;

  FailureSearchPackage({required this.message});
}
