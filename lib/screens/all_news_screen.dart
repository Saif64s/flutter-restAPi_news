import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/vars.dart';

class AllNewsScreen extends StatefulWidget {
  const AllNewsScreen({super.key});

  @override
  State<AllNewsScreen> createState() => _AllNewsScreenState();
}

class _AllNewsScreenState extends State<AllNewsScreen> {
  var newsType = NewsType.allNews;
  int currentIdx = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if (currentIdx == 0) return;
              setState(() {
                currentIdx -= 1;
              });
            },
            icon: const Icon(
              Icons.arrow_circle_left,
              size: 30,
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, idx) {
                  return Padding(
                    padding: const EdgeInsets.all(14),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentIdx = idx;
                        });
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currentIdx == idx
                              ? Colors.amber
                              : Colors.lightGreenAccent,
                        ),
                        child: Center(
                          child: Text(
                            '${idx + 1}',
                            style: GoogleFonts.aBeeZee(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          IconButton(
            onPressed: () {
              if (currentIdx == 4) return;
              setState(() {
                currentIdx += 1;
              });
            },
            icon: const Icon(
              Icons.arrow_circle_right,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
