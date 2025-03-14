import 'package:refilc/theme/colors/colors.dart';
import 'package:flutter/material.dart';

class RoundedBottomSheet extends StatelessWidget {
  const RoundedBottomSheet({
    super.key,
    this.child,
    this.borderRadius = 16.0,
    this.shrink = true,
    this.showHandle = true,
    this.backgroundColor,
  });

  final Widget? child;
  final double borderRadius;
  final bool shrink;
  final bool showHandle;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        ),
      ),
      child: Column(
        mainAxisSize: shrink ? MainAxisSize.min : MainAxisSize.max,
        children: [
          if (showHandle)
            Container(
              width: 42.0,
              height: 4.0,
              margin: const EdgeInsets.only(top: 12.0, bottom: 4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
                color: AppColors.of(context).text.withValues(alpha: 0.10),
              ),
            ),
          if (child != null) child!,
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }
}

Future<T?> showRoundedModalBottomSheet<T>(
  BuildContext context, {
  required Widget child,
  bool rootNavigator = true,
  bool showHandle = true,
  Color? backgroundColor,
}) async {
  return await showModalBottomSheet<T>(
    useSafeArea: false,
    context: context,
    backgroundColor: const Color(0x00000000),
    elevation: 0,
    isDismissible: true,
    useRootNavigator: rootNavigator,
    isScrollControlled: true,
    builder: (context) => RoundedBottomSheet(
      backgroundColor: backgroundColor,
      showHandle: showHandle,
      child: child,
    ),
  );
}

PersistentBottomSheetController showRoundedBottomSheet(
  BuildContext context, {
  required Widget child,
}) {
  return showBottomSheet(
    context: context,
    backgroundColor: const Color(0x00000000),
    elevation: 12.0,
    builder: (context) => RoundedBottomSheet(child: child),
  );
}
