import 'package:flutter/material.dart';
import 'package:uicons/uicons.dart';

class PackageDialog extends StatefulWidget {
  final String? title;
  final VoidCallback? onTap;
  final Widget? content;
  final Widget? actions;

  const PackageDialog({
    super.key,
    this.title,
    this.onTap,
    this.actions,
    this.content,
  });

  @override
  State<PackageDialog> createState() => _PackageDialogState();
}

class _PackageDialogState extends State<PackageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.title ?? '',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(100),
                  onTap: widget.onTap,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(UIcons.solidRounded.x, size: 18),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            if (widget.content != null) ...[
              widget.content!,
            ],
            const SizedBox(height: 10),
            if (widget.actions != null) ...[
              widget.actions!,
            ]
          ],
        ),
      ),
    );
  }
}
