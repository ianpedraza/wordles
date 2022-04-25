import 'dart:convert';
import 'dart:developer';

import 'package:universal_html/html.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:wordles/data/datasources/dynamic_links_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:wordles/data/domain/wordle.dart';
import 'package:wordles/data/framework/firebase/firebase_constants.dart';
import 'package:wordles/data/usecases/wordles/get_wordle_use_case.dart';
import 'package:wordles/router.gr.dart';
import 'package:wordles/utils/toast_utils.dart';
import 'package:wordles/utils/words_manager.dart';
import 'package:wordles/values/resources.dart';
import 'package:wordles/values/strings.dart';

class FirebaseDynamicLinksDataSource implements DynamicLinksDataSource {
  static const tag = "FirebaseDynamicLinksDataSource";

  final dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  Future<Uri?> createDynamicLink(Wordle wordle) async {
    try {
      final dataLink = 'https://wordles.online/?id=${wordle.id}';
      const packageName = 'online.wordles.app';
      const uriPrefix = 'https://wordles.page.link';
      const appStoreId = '1234567890';

      final socialTitle = dynamicLinksTitle.replaceFirst(stringsPlaceholder, wordle.name);
      final socialDescription = dynamicLinksDescription.replaceFirst(stringsPlaceholder, wordle.name);

      Uri? dynamiLink;

      if (kIsWeb) {
        final headers = {'Content-Type': 'application/json'};

        final body = {
          'dynamicLinkInfo': {
            'link': dataLink,
            'domainUriPrefix': uriPrefix,
            'androidInfo': {
              'androidPackageName': packageName,
            },
            'iosInfo': {
              'iosBundleId': packageName,
              'iosAppStoreId': appStoreId,
            },
            'socialMetaTagInfo': {
              'socialTitle': socialTitle,
              'socialDescription': socialDescription,
              'socialImageLink': Resources.logoUrl,
            }
          },
          'suffix': {'option': 'SHORT'}
        };

        http.Response response = await http.post(
          Uri.parse(FirebaseConstants.kDynamicLinkURL),
          body: jsonEncode(body),
          headers: headers,
          encoding: Encoding.getByName("utf-8"),
        );

        if (response.statusCode == 200) {
          Map bodyAnswer = jsonDecode(response.body);
          dynamiLink = Uri.parse(bodyAnswer['shortLink']);
        }
      } else {
        final DynamicLinkParameters parameters = DynamicLinkParameters(
          uriPrefix: uriPrefix,
          link: Uri.parse(dataLink),
          androidParameters: const AndroidParameters(
            packageName: packageName,
            minimumVersion: 1,
          ),
          iosParameters: const IOSParameters(
            bundleId: packageName,
            minimumVersion: '1',
            appStoreId: appStoreId,
          ),
          socialMetaTagParameters: SocialMetaTagParameters(
            title: socialTitle,
            description: socialDescription,
            imageUrl: Uri.parse(Resources.logoUrl),
          ),
        );

        var dynamicUrl = await dynamicLinks.buildShortLink(parameters);
        dynamiLink = dynamicUrl.shortUrl;
      }

      return dynamiLink;
    } catch (error) {
      log("$tag:createDynamicLink:Error:$error");
      return null;
    }
  }

  @override
  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      if (kIsWeb) {
        var dynamicLink = Uri.dataFromString(window.location.href);

        if (dynamicLink.queryParameters.containsKey('id')) {
          _handleDynamicLink(context, dynamicLink);
        }
      } else {
        final PendingDynamicLinkData? data = await FirebaseDynamicLinks.instance.getInitialLink();
        final Uri? dynamicLink = data?.link;

        if (dynamicLink != null) _handleDynamicLink(context, dynamicLink);

        dynamicLinks.onLink.listen((event) => _handleDynamicLink(context, event.link));
      }
    } catch (error) {
      log("$tag:createDynamicLink:Error:$error");
    }
  }

  void _handleDynamicLink(BuildContext context, Uri dynamicLink) async {
    if (!dynamicLink.queryParametersAll.containsKey('id')) {
      ToastUtils.showSimpleToast(eInvalidLink);
      AutoRouter.of(context).push(const HomeRoute());
      return;
    }

    String id = dynamicLink.queryParameters['id']!;

    final GetWordleUseCase getWordleUseCase = Injector.appInstance.get();
    final wordle = await getWordleUseCase.invoke(id);

    if (wordle != null) {
      final word = WordsManager.words[wordle.indexWord];
      AutoRouter.of(context).push(GameRoute(word: word, name: wordle.name));
    } else {
      ToastUtils.showSimpleToast(eInvalidLink);
      AutoRouter.of(context).push(const HomeRoute());
    }
  }
}
