//Packages
import 'package:flutter/material.dart';
import 'package:news_rest_api/screens/blog_details.dart';
import 'package:news_rest_api/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'consts/theme_data.dart';

import 'providers/theme_provider.dart';

void main() {
  runApp(const NewsRestAPI());
}

class NewsRestAPI extends StatefulWidget {
  const NewsRestAPI({Key? key}) : super(key: key);

  @override
  State<NewsRestAPI> createState() => _NewsRestAPIState();
}

class _NewsRestAPIState extends State<NewsRestAPI> {
  //Need it to access the theme Provider
  ThemeProvider themeChangeProvider = ThemeProvider();

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  //Fetch the current theme
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          //Notify about theme changes
          return themeChangeProvider;
        }),
      ],
      child:
          //Notify about theme changes
          Consumer<ThemeProvider>(builder: (context, themeChangeProvider, ch) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: Styles.themeData(themeChangeProvider.getDarkTheme, context),
          home: const HomeScreen(),
          routes: {
            NewsDetailsScreen.routeName: (ctx) => const NewsDetailsScreen()
          },
        );
      }),
    );
  }
}
