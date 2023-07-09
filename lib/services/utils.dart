import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class Util {
  BuildContext context;
  Util(this.context);

  bool get darkTheme => Provider.of<ThemeProvider>(context).getDarkTheme;
  Color get color => darkTheme ? Colors.white : Colors.black;

  Size get getScreenSize => MediaQuery.of(context).size;
  bool get getTheme => Provider.of<ThemeProvider>(context).getDarkTheme;
  Color get getColor => getTheme ? Colors.white : Colors.black;

  Color get baseShimmerColor =>
      getTheme ? Colors.grey.shade500 : Colors.grey.shade200;

  Color get highlightShimmerColor =>
      getTheme ? Colors.grey.shade700 : Colors.grey.shade400;

  Color get widgetShimmerColor =>
      getTheme ? Colors.grey.shade600 : Colors.grey.shade100;
}
