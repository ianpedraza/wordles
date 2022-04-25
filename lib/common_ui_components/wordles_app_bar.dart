import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordles/router.gr.dart';
import 'package:wordles/utils/icons.dart';
import 'package:wordles/values/colors.dart';
import 'package:wordles/values/strings.dart';

class WordlesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool backArrow;
  final bool showHelp;

  const WordlesAppBar({
    Key? key,
    this.backArrow = false,
    this.showHelp = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 98,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          backArrow
              ? IconButton(
                  onPressed: () => Navigator.of(context).maybePop(),
                  icon: kIsWeb || Platform.isAndroid
                      ? getIcon(AppIcons.backArrowAndroid)
                      : getIcon(AppIcons.backArrowIOS),
                )
              : Container(),
          showHelp
              ? IconButton(
                  onPressed: () => AutoRouter.of(context).push(HelpRoute()),
                  icon: getIcon(AppIcons.helpOutlined),
                )
              : Container(),
        ],
      ),
      title: RichText(
        text: TextSpan(
          text: appName.substring(0, 5),
          style: GoogleFonts.abhayaLibre(
            textStyle: TextStyle(
              fontSize: 30.0,
              color: Theme.of(context).textTheme.bodyText1?.color,
            ),
            fontWeight: FontWeight.w600,
          ),
          children: <TextSpan>[
            TextSpan(
              text: appName.substring(5),
              style: const TextStyle(color: wordlesRed),
            ),
          ],
        ),
      ),
      centerTitle: true,
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
