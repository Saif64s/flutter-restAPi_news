import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PillTab extends StatelessWidget {
  const PillTab(
      {super.key,
      required this.text,
      required this.onTap,
      required this.color,
      required this.fontSize});
  final String text;
  final Function() onTap;
  final Color? color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              text,
              style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
