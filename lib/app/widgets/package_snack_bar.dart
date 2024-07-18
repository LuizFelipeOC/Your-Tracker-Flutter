import 'package:flutter/material.dart';
import 'package:your_tracker/app/shared/app_colors.dart';

enum PackageSnackBarType { success, idle, error, warning }

class PackageSnackBar extends SnackBar {
  final PackageSnackBarType type;

  const PackageSnackBar({
    super.key,
    required super.content,
    super.duration,
    this.type = PackageSnackBarType.idle,
  });

  Color _getBackgrounColor(PackageSnackBarType type) {
    if (type == PackageSnackBarType.success) {
      return AppColors.green;
    }

    if (type == PackageSnackBarType.error) {
      return AppColors.redWith80Opacity;
    }

    return AppColors.black;
  }

  @override
  EdgeInsetsGeometry? get padding => const EdgeInsets.all(15);

  @override
  Color? get backgroundColor => _getBackgrounColor(type);

  @override
  SnackBarBehavior? get behavior => SnackBarBehavior.floating;

  @override
  ShapeBorder? get shape => RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  @override
  double? get elevation => 2;
}
