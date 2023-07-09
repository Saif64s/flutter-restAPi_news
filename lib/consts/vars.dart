import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum NewsType {
  allNews,
  trending,
}

enum SortItem {
  relevnet,
  popular,
  latest,
}

TextStyle smallTextStyle =
    GoogleFonts.aBeeZee(fontSize: 14, fontWeight: FontWeight.w500);

TextStyle titleTextStyle =
    GoogleFonts.oswald(fontSize: 28, fontWeight: FontWeight.bold);
const List<String> searchKeywords = [
  "Football",
  "Flutter",
  "Python",
  "Weather",
  "Crypto",
  "Bitcoin",
  "Youtube",
  "Netflix",
  "Meta"
];
