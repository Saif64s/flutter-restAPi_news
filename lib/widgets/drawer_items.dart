import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key,
      required this.itemIcon,
      required this.itemText,
      required this.onTap});

  final IconData itemIcon;
  final String itemText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(
          itemText,
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: Icon(
          itemIcon,
          color: themeProvider.getDarkTheme ? Colors.white : Colors.black,
          size: 30,
        ),
        onTap: onTap,
      ),
    );
  }
}
