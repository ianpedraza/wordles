import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordles/common_ui_components/board/board.dart';
import 'package:wordles/common_ui_components/wordles_alert_dialog/wordles_alert_dialog_button.dart';
import 'package:wordles/common_ui_components/wordles_drawer/wordles_drawer.dart';
import 'package:wordles/common_ui_components/wordles_alert_dialog/wordles_alert_dialog.dart';
import 'package:wordles/common_ui_components/wordles_app_bar.dart';
import 'package:wordles/common_ui_components/keyboard/keyboard.dart';
import 'package:wordles/common_ui_components/notification_banner/notification_banner.dart';
import 'package:wordles/common_ui_components/notification_banner/notification_banner_types.dart';
import 'package:wordles/feature_game/game_provider.dart';
import 'package:wordles/utils/share_utils.dart';
import 'package:wordles/values/strings.dart';

class GamePage extends StatelessWidget {
  final String word;
  final String? name;

  const GamePage({
    Key? key,
    required this.word,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GameProvider>(
      create: (context) => GameProvider(word, name),
      child: WillPopScope(
        onWillPop: () async {
          final result = await showOkCancelAlertDialog(
            context: context,
            title: exitGame,
            message: exitGameDescription,
            okLabel: exit,
            cancelLabel: cancel,
          );

          return result == OkCancelResult.ok;
        },
        child: Scaffold(
          appBar: const WordlesAppBar(backArrow: true),
          endDrawer: const WordlesDrawer(),
          body: SafeArea(
            child: Consumer<GameProvider>(
              builder: (context, provider, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      children: [
                        const Spacer(),
                        Board(model: provider.wordleModel),
                        const Spacer(),
                        Keyboard(
                          keyboardModel: provider.keyboardModel,
                          onKeyPressed: (value) => provider.write(value),
                          onDelete: () => provider.delete(),
                          onEnter: () => provider.check(),
                        ),
                      ],
                    ),
                    NotificationBanner(
                      message: provider.error,
                      type: NotificationBannerType.warning,
                    ),
                    WordlesAlertDialog(
                      show: provider.hasWon,
                      title: youWin,
                      message: "$theWordWas $word",
                      primaryButtonText: ok,
                      onPrimaryPressed: () => AutoRouter.of(context).navigateBack(),
                      secondaryButtonText: share,
                      onSecondaryPressed: () => ShareUtils.share(provider.shared),
                      extraButtons: <WordlesAlertDialogButton>[
                        WordlesAlertDialogButton(
                          text: seeMeaningOfWord,
                          onPressed: () => provider.showMeaning(context),
                        )
                      ],
                    ),
                    WordlesAlertDialog(
                      show: provider.hasLose,
                      title: youLost,
                      message: "$theWordWas $word",
                      primaryButtonText: ok,
                      onPrimaryPressed: () => AutoRouter.of(context).navigateBack(),
                      secondaryButtonText: share,
                      onSecondaryPressed: () => ShareUtils.share(provider.shared),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
