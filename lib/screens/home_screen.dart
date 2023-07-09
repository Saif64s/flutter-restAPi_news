import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_rest_api/consts/global_colors.dart';
import 'package:news_rest_api/consts/vars.dart';
import 'package:news_rest_api/screens/all_news_tab.dart';
import 'package:news_rest_api/screens/serach_scree.dart';
import 'package:news_rest_api/services/utils.dart';
import 'package:news_rest_api/widgets/news_drawer.dart';
import 'package:news_rest_api/widgets/tab_page.dart';
import 'package:page_transition/page_transition.dart';

// import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';
import '../widgets/trending_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;
  int currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final color = Util(context).color;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const NewsDrwaer(),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const SearchScreen(),
                      inheritTheme: true,
                      ctx: context),
                );
              },
              icon: const Icon(
                Icons.search_rounded,
                size: 30,
              ))
        ],
        title: Text(
          'Daily Trendings',
          style: GoogleFonts.aBeeZee(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: color,
        ),
        backgroundColor:
            themeProvider.getDarkTheme ? darkScaffoldColor : lightScaffoldColor,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                PillTab(
                  text: 'All news',
                  onTap: () {
                    if (newsType == NewsType.allNews) {
                      return;
                    }
                    setState(() {
                      newsType = NewsType.allNews;
                    });
                  },
                  color: NewsType.allNews == newsType
                      ? Colors.green[400]
                      : Colors.grey,
                  fontSize: NewsType.allNews == newsType ? 22 : 18,
                ),
                PillTab(
                  text: 'Trendings',
                  onTap: () {
                    if (newsType == NewsType.trending) {
                      return;
                    }
                    setState(() {
                      newsType = NewsType.trending;
                    });
                  },
                  color: NewsType.trending == newsType
                      ? Colors.green[400]
                      : Colors.grey,
                  fontSize: NewsType.trending == newsType ? 22 : 18,
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (newsType == NewsType.trending)
              SizedBox(
                height: size.height * 0.5,
                child: Swiper(
                  autoplayDelay: 8000,
                  autoplay: true,
                  itemWidth: size.width * 0.9,
                  layout: SwiperLayout.STACK,
                  viewportFraction: 0.9,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const TopTrendingWidget();
                  },
                ),
              ),
            if (newsType == NewsType.allNews) const AllNewsTabView(),
          ],
        ),
      ),
    );
  }
}
