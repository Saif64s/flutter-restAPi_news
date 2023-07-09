import 'package:flutter/material.dart';

import '../widgets/screen_parts/article.dart';
import '../widgets/screen_parts/dropdown.dart';
import 'all_news_screen.dart';

class AllNewsTabView extends StatefulWidget {
  const AllNewsTabView({super.key});

  @override
  State<AllNewsTabView> createState() => _AllNewsTabViewState();
}

class _AllNewsTabViewState extends State<AllNewsTabView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [
          AllNewsScreen(),
          SizedBox(height: 10),
          NewsDropDown(),
          SizedBox(height: 20),
          ArticleCard(),
        ],
      ),
    );
  }
}
