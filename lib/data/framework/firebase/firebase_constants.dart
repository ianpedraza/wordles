import 'package:wordles/firebase_options.dart';

class FirebaseConstants {
  static const String collectionWordles = "wordles";
  static const String wordleOfTheDay = "wordleOfTheDay";

  static String kDynamicLinkURL =
      'https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=${DefaultFirebaseOptions.currentPlatform.apiKey}';
}
