import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordles/common_ui_components/wordles_drawer/drawer_provider.dart';
import 'package:wordles/styles/text_styles.dart';
import 'package:wordles/utils/url_utils.dart';
import 'package:wordles/values/colors.dart';
import 'package:wordles/values/strings.dart';

class WordlesDrawer extends StatelessWidget {
  const WordlesDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DrawerProvider>(
      create: (context) => DrawerProvider(context),
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 50),
            SizedBox(
              height: 30.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: Text(
                  settings,
                  style: TextStyles(context).baseBold18Text,
                ),
              ),
            ),
            const Divider(),
            Consumer<DrawerProvider>(builder: (context, provider, child) {
              return ListTile(
                title: Text(
                  darkMode,
                  style: TextStyles(context).baseRegular16Text,
                ),
                trailing: Switch(
                  value: provider.isDarkMode,
                  onChanged: (value) => provider.setDark(value),
                ),
                onTap: () => provider.toggle(),
              );
            }),
            const Divider(),
            ListTile(
              leading: Text(
                feedback,
                style: TextStyles(context).baseRegular16Text,
              ),
              trailing: Text(
                email,
                style: TextStyles(context).baseRegular16Text.apply(
                      color: wordleGrey,
                      decoration: TextDecoration.underline,
                    ),
              ),
              onTap: () => URLUtils.launch(URLUtils.mailTo),
            ),
            const Divider(),
            ListTile(
              leading: Text(
                follow,
                style: TextStyles(context).baseRegular16Text,
              ),
              trailing: Text(
                twitter,
                style: TextStyles(context).baseRegular16Text.apply(
                      color: wordleGrey,
                      decoration: TextDecoration.underline,
                    ),
              ),
              onTap: () => URLUtils.launch(URLUtils.twitterUrl),
            ),
          ],
        ),
      ),
    );
  }
}
