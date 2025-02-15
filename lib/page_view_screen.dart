

import 'package:c007_page_view_sync_list_view/controllers/current_index_controller.dart';
import 'package:c007_page_view_sync_list_view/helpers/colored_box_item.dart';
import 'package:c007_page_view_sync_list_view/helpers/rainbow_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageViewScreen extends ConsumerStatefulWidget {
  const PageViewScreen({
    super.key,
    required this.allColors,
  });
  final List<ColorInfo> allColors;

  @override
  ConsumerState<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends ConsumerState<PageViewScreen> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(currentIndexController, (_, currIndex) {
      _pageController.jumpToPage(currIndex);
    });
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          ref.read(currentIndexController.notifier).setIndex(index);
        },
        children: widget.allColors
            .map((color) => ColoredBoxItem(colorInfo: color))
            .toList(),
      ),
    );
  }
}
