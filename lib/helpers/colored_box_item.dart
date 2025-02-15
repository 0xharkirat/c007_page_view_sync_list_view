import 'package:c007_page_view_sync_list_view/helpers/rainbow_colors.dart';
import 'package:flutter/material.dart';

/// A simple ColoredBox with a Text widget that displays the shade of the color.
class ColoredBoxItem extends StatelessWidget {
  const ColoredBoxItem({
    super.key,
    required this.colorInfo,
    this.isSelected = false,
  });
  final ColorInfo colorInfo;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    // Use the color luminance to determine the border and text color for better contrast
    final isDark = colorInfo.color.computeLuminance() < 0.3;
    final borderColor = isDark ? Colors.white : Colors.black;
    // * When selected, the border is visible
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorInfo.color,
        border: Border.all(
          color: isSelected ? borderColor : Colors.transparent,
          width: 3,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            colorInfo.shade.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ),
      ),
    );
  }
}
