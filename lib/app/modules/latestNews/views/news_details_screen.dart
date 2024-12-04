import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/app/data/models/latestNewsModel.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/app_text.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/cacheImage.dart';

class NewsDetailsScreen extends GetView {
  final LatestNewsModel latestNewsModel;

  const NewsDetailsScreen({super.key, required this.latestNewsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //................................................................
      //................................................................
      appBar: buildAppBarWidget(appBarText: '', backgroundColor: Colors.red),

      //............................................................................
      //............................................................................
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextRichWidget(
                  firstText: 'Date ',
                  secondText: DateFormat.yMMMd().format(
                      DateTime.parse(latestNewsModel.published.toString())),
                  firstTextStyle: AppText.subTitleBoldTextStyle,
                  secondTextStyle: AppText.subTitleNormalTextStyle,
                ),

                const SizedBox(
                  height: 20.0,
                ),

                _buildTextWidget(
                    text: latestNewsModel.title.toString(),
                    textStyle: AppText.titleTextStyle),

                const SizedBox(
                  height: 20.0,
                ),

                buildCachedImageWidget(latestNewsModel: latestNewsModel),

                const SizedBox(
                  height: 20.0,
                ),
                //.........................................................
                //... Title for news...
                //.........................................................

                //.........................................................
                //... Description for news...
                //.........................................................

                _buildTextWidget(
                    text: latestNewsModel.description.toString(),
                    textStyle: AppText.descriptionTextStyle),
                TextButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(latestNewsModel.url.toString());
                    if (await canLaunchUrl(url)) {
                      await launchUrl(
                        url,
                        mode: LaunchMode.inAppWebView,
                      );
                    } else {
                      throw 'Could not launch ';
                    }
                  },
                  child: const Text('read more..'),
                ),

                //..................................................................
                //..................................................................
                //        Here is a two types of text below
                //          1. Author name
                //
                //           2. Category
                //..................................................................
                //..................................................................

                const SizedBox(
                  height: 50.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Display the author's name of the article.
// This text represents the writer of the article and should be styled to be subtle but readable.
                    Expanded(
                      flex: 1,
                      child: _buildTextRichWidget(
                          firstText: 'Author ',
                          secondText: latestNewsModel.author.toString(),
                          firstTextStyle: AppText.subTitleBoldTextStyle,
                          secondTextStyle: AppText.subTitleNormalTextStyle),
                    ),

// Display the category of the article.
// Represents the section or topic of the article (e.g., Sports, Technology), helping users categorize the content.
                    Expanded(
                      flex: 1,
                      child: _buildTextRichWidget(
                          firstText: 'Categories ',
                          secondText:
                              latestNewsModel.category!.join(', ').toString(),
                          firstTextStyle: AppText.subTitleBoldTextStyle,
                          secondTextStyle: AppText.subTitleNormalTextStyle),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextWidget({
  required String text,
  required TextStyle textStyle,
}) {
  return Text(
    text,
    style: textStyle,
    textAlign: TextAlign.justify,
  );
}

Widget _buildTextRichWidget({
  required String firstText,
  required String secondText,
  required TextStyle firstTextStyle,
  required TextStyle secondTextStyle,
}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: firstText,
          style: firstTextStyle,
        ),
        TextSpan(
          text: secondText,
          style: secondTextStyle,
        ),
      ],
    ),
  );
}
