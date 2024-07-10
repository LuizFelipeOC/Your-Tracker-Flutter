import 'package:flutter/material.dart';
import 'package:your_tracker/app/data/model%20/package_model.dart';
import 'package:your_tracker/app/shared/app_colors.dart';

class ModalSheetSavePackage extends StatefulWidget {
  final PackageModel package;

  const ModalSheetSavePackage({super.key, required this.package});

  @override
  State<ModalSheetSavePackage> createState() => _ModalSheetSavePackageState();
}

class _ModalSheetSavePackageState extends State<ModalSheetSavePackage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Estamos salvando seu pacote',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 50),
          LinearProgressIndicator(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.blackWith60Opacity,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
