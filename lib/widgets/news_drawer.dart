import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_rest_api/screens/bookmarks_screen.dart';
import 'package:news_rest_api/services/utils.dart';
import 'package:news_rest_api/widgets/drawer_items.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../consts/global_colors.dart';
import '../providers/theme_provider.dart';

class NewsDrwaer extends StatefulWidget {
  const NewsDrwaer({super.key});

  @override
  State<NewsDrwaer> createState() => _NewsDrwaerState();
}

class _NewsDrwaerState extends State<NewsDrwaer> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final color = Util(context).color;
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
            child: Flexible(
              child: Image.asset('assets/images/newspaper.png'),
            ),
          ),
          DrawerItem(
            itemIcon: Icons.home_filled,
            itemText: 'Home',
            onTap: () {
              // Navigator.push(
              //   context,
              //   PageTransition(
              //       type: PageTransitionType.rightToLeft,
              //       child: const HomeScreen(),
              //       inheritTheme: true,
              //       ctx: context),
              // );
              Navigator.pop(context);
            },
          ),
          DrawerItem(
            itemIcon: Icons.bookmark_added,
            itemText: 'Bookmarks',
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.rightToLeft,
                    child: const BookmarkScreen(),
                    inheritTheme: true,
                    ctx: context),
              );
            },
          ),
          const Divider(thickness: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SwitchListTile(
                title: Text(
                  themeProvider.getDarkTheme ? 'Dark' : 'Light',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                secondary: Icon(
                  themeProvider.getDarkTheme ? darkIcon : lightIcon,
                  size: 30,
                  color: color,
                ),
                value: themeProvider.getDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                    themeProvider.setDarkTheme = value;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
