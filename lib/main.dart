import 'package:c007_page_view_sync_list_view/helpers/app_scroll_behavior.dart';
import 'package:c007_page_view_sync_list_view/list_view_screen.dart';
import 'package:c007_page_view_sync_list_view/page_view_screen.dart';
import 'package:c007_page_view_sync_list_view/helpers/rainbow_colors.dart';
import 'package:c007_page_view_sync_list_view/helpers/split_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

final rainbowColors = RainbowColors.generate();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // * Needed to enable PageView scrolling on desktop and web
      scrollBehavior: AppScrollBehavior(),
      home: SplitView(
        leftBuilder: (_) => PageViewScreen(
          allColors: rainbowColors,
        ),
        rightBuilder: (_) => ListViewScreen(
          allColors: rainbowColors,
        ),
      ),
    );
  }
}
