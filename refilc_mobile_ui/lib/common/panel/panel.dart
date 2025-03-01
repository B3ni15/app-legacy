import 'package:refilc/models/settings.dart';
import 'package:refilc/theme/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Panel extends StatelessWidget {
  const Panel({
    super.key,
    this.child,
    this.title,
    this.padding,
    this.hasShadow = true,
    this.isTransparent = false,
  });

  final Widget? child;
  final Widget? title;
  final EdgeInsetsGeometry? padding;
  final bool hasShadow;
  final bool isTransparent;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Panel Title
        if (title != null) PanelTitle(title: title!),

        // Panel Body
        if (child != null)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: isTransparent
                  ? Colors.transparent
                  : Theme.of(context).colorScheme.surface,
              boxShadow: [
                if ((hasShadow && !isTransparent) &&
                    Provider.of<SettingsProvider>(context, listen: false)
                        .shadowEffect)
                  BoxShadow(
                    offset: const Offset(0, 21),
                    blurRadius: 23.0,
                    color: Theme.of(context).shadowColor,
                  )
              ],
            ),
            padding: padding ?? const EdgeInsets.all(8.0),
            child: child,
          ),
      ],
    );
  }
}

class PanelTitle extends StatelessWidget {
  const PanelTitle({super.key, required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0, bottom: 8.0),
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.of(context).text.withValues(alpha: 0.65)),
        child: title,
      ),
    );
  }
}

class PanelHeader extends StatelessWidget {
  const PanelHeader({super.key, required this.padding});

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          if (Provider.of<SettingsProvider>(context, listen: false)
              .shadowEffect)
            BoxShadow(
              offset: const Offset(0, 21),
              blurRadius: 23.0,
              color: Theme.of(context).shadowColor,
            )
        ],
      ),
    );
  }
}

class PanelBody extends StatelessWidget {
  const PanelBody({super.key, this.child, this.padding});

  final Widget? child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          if (Provider.of<SettingsProvider>(context, listen: false)
              .shadowEffect)
            BoxShadow(
              offset: const Offset(0, 21),
              blurRadius: 23.0,
              color: Theme.of(context).shadowColor,
            )
        ],
      ),
      padding: padding,
      child: child,
    );
  }
}

class PanelFooter extends StatelessWidget {
  const PanelFooter({super.key, required this.padding});

  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16.0),
            bottomRight: Radius.circular(16.0)),
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          if (Provider.of<SettingsProvider>(context, listen: false)
              .shadowEffect)
            BoxShadow(
              offset: const Offset(0, 21),
              blurRadius: 23.0,
              color: Theme.of(context).shadowColor,
            )
        ],
      ),
    );
  }
}
