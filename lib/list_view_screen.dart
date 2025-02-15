import 'package:c007_page_view_sync_list_view/controllers/current_index_controller.dart';
import 'package:c007_page_view_sync_list_view/helpers/colored_box_item.dart';
import 'package:c007_page_view_sync_list_view/helpers/rainbow_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ListViewScreen extends ConsumerStatefulWidget {
  const ListViewScreen({
    super.key,
    required this.allColors,
  });
  final List<ColorInfo> allColors;

  @override
  ConsumerState<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends ConsumerState<ListViewScreen> {
  final _scrollController = AutoScrollController(
    suggestedRowHeight: 80, // approximate height of each list item
  );

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(currentIndexController, (_, currIndex) {
      _scrollController.scrollToIndex(currIndex,
          preferPosition: AutoScrollPosition.middle);
    });
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: widget.allColors.length,
        itemBuilder: (_, index) {
          final colorInfo = widget.allColors[index];
          return AutoScrollTag(
            key: ValueKey(index),
            controller: _scrollController,
            index: index,
            child: GestureDetector(
              onTap: () {
                ref.read(currentIndexController.notifier).setIndex(index);
              },
              child: Consumer(builder: (_, ref, __) {
                final isSelected = ref.watch(currentIndexController) == index;
                return ColoredBoxItem(
                  colorInfo: colorInfo,
                  isSelected: isSelected,
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
