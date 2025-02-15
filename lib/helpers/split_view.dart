import 'package:flutter/material.dart';

/// A widget that splits the screen into two parts horizontally.
/// https://codewithandrea.com/tips/responsive-split-view-flutter/
class SplitView extends StatelessWidget {
  const SplitView({
    super.key,
    required this.leftBuilder,
    required this.rightBuilder,
  });
  final WidgetBuilder leftBuilder;
  final WidgetBuilder rightBuilder;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: leftBuilder(context),
        ),
        Expanded(
          flex: 1,
          child: rightBuilder(context),
        ),
      ],
    );
  }
}
