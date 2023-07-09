import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:news_rest_api/widgets/screen_parts/news_details_webview.dart';
import 'package:page_transition/page_transition.dart';

import '../consts/vars.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.date,
      required this.link});
  final String imageUrl;
  final String title;
  final String date;
  final String link;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          left: 0,
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            width: 50,
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            width: 50,
          ),
        ),
        Container(
          color: Theme.of(context).cardColor,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FancyShimmerImage(
                    height: size.height * 0.12,
                    width: size.height * 0.12,
                    boxFit: BoxFit.fill,
                    imageUrl: imageUrl),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      title,
                      style: smallTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Less than a minute',
                      style: smallTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () async {
                          Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: NewsDetailsWebView(
                                  link: link,
                                ),
                                inheritTheme: true,
                                ctx: context),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.green[800],
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.dataset_linked_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        date,
                        style: smallTextStyle.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }
}
