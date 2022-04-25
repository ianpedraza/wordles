import 'dart:developer';

import 'package:url_launcher/url_launcher.dart' as ul;
import 'package:wordles/values/strings.dart';

class URLUtils {
  static const String mailTo = "mailto:dev@ianpedraza.com?subject=Feedback%20$appName";
  static const String twitterUrl = "https://twitter.com/ianpedrazac";

  static Future<void> launch(String url) async {
    if (!await ul.launch(url)) {
      log('Could not launch $url');
    }
  }
}
