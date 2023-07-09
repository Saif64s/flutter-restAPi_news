import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:page_transition/page_transition.dart';

import '../screens/blog_details.dart';
import '../services/utils.dart';
import 'screen_parts/news_details_webview.dart';

class TopTrendingWidget extends StatelessWidget {
  const TopTrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = Util(context).getScreenSize;
    final Color color = Util(context).getColor;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, NewsDetailsScreen.routeName);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.fill,
                  errorWidget: Image.asset('assets/images/empty_image.png'),
                  imageUrl:
                      "https://s3u.tmimgcdn.com/1635272-1596463010028_Preview%2002.png",
                  height: size.height * 0.33,
                  width: double.infinity,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Title',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: NewsDetailsWebView(
                              link: '',
                            ),
                            inheritTheme: true,
                            ctx: context),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.green[800],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.dataset_linked_outlined,
                          color: color,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SelectableText(
                    "20-20-2022",
                    style: GoogleFonts.montserrat(fontSize: 15),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
