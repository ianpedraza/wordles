import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:provider/provider.dart';
import 'package:wordles/common_providers/loader_state.dart';
import 'package:wordles/common_ui_components/wordles_alert_dialog/wordles_alert_dialog.dart';
import 'package:wordles/common_ui_components/wordles_button.dart';
import 'package:wordles/common_ui_components/wordles_drawer/wordles_drawer.dart';
import 'package:wordles/common_ui_components/wordles_app_bar.dart';
import 'package:wordles/common_ui_components/wordles_text_field.dart';
import 'package:wordles/data/usecases/dynamic_links/retrieve_dynamic_link_use_case.dart';
import 'package:wordles/feature_home/create_wordles_provider.dart';
import 'package:wordles/feature_home/wordle_of_the_day_provider.dart';
import 'package:wordles/router.gr.dart';
import 'package:wordles/styles/text_styles.dart';
import 'package:wordles/utils/input_formaters.dart';
import 'package:wordles/utils/share_utils.dart';
import 'package:wordles/utils/types.dart';
import 'package:wordles/utils/words_manager.dart';
import 'package:wordles/values/dimens.dart';
import 'package:wordles/values/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final _wordFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();

  final _wordEditingController = TextEditingController();
  final _nameEditingController = TextEditingController();

  final RetrieveDynamicLinkUseCase _dynamicLinkService = Injector.appInstance.get();
  Timer? _timerLink;

  @override
  void initState() {
    super.initState();
    _dynamicLinkService.retrieveDynamicLink(context);
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _timerLink = Timer(
        const Duration(milliseconds: 1000),
        () => _dynamicLinkService.retrieveDynamicLink(context),
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);

    if (_timerLink != null) {
      _timerLink!.cancel();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CreateWordlesProvider>(
          create: (_) => CreateWordlesProvider(),
        ),
        ChangeNotifierProvider<WordleOfTheDayProvider>(
          create: (_) => WordleOfTheDayProvider(),
        ),
      ],
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: const WordlesAppBar(),
          endDrawer: const WordlesDrawer(),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Center(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(Dimens.pagePadding),
                    constraints: const BoxConstraints(maxWidth: Dimens.maxWidth),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: Dimens.componentsDivider30),
                        Text(
                          createInstrucctions,
                          style: TextStyles(context).baseRegular18Text,
                        ),
                        const SizedBox(height: Dimens.componentsDivider30),
                        Consumer<CreateWordlesProvider>(builder: (context, provider, child) {
                          return Column(
                            children: [
                              WordlesTextField(
                                maxLenght: 5,
                                hint: insertWord,
                                focusNode: _wordFocusNode,
                                error: provider.wordError,
                                controller: _wordEditingController,
                                onChange: (value) => provider.setWord(_wordEditingController.text),
                                onEditingComplete: () => FocusScope.of(context).requestFocus(_nameFocusNode),
                                inputFormatters: InputFormatters.onlyUppercased,
                                textCapitalization: TextCapitalization.characters,
                              ),
                              const SizedBox(height: Dimens.componentsDivider),
                              WordlesTextField(
                                maxLenght: 10,
                                hint: insertName,
                                error: provider.nameError,
                                focusNode: _nameFocusNode,
                                controller: _nameEditingController,
                                onChange: (value) => provider.setName(_nameEditingController.text),
                                onTap: provider.isValidName && provider.isValidWord ? provider.createWordle : null,
                                inputFormatters: [
                                  ...InputFormatters.onlySpanishCharacters,
                                  ...InputFormatters.capitalizeFirst,
                                ],
                                textCapitalization: TextCapitalization.sentences,
                              ),
                              const SizedBox(height: Dimens.componentsDivider),
                              provider.state == ViewState.busy
                                  ? const Center(child: CircularProgressIndicator())
                                  : WordlesButton(
                                      text: createWordle,
                                      onPressed:
                                          provider.isValidName && provider.isValidWord ? provider.createWordle : null,
                                    ),
                            ],
                          );
                        }),
                        const SizedBox(height: Dimens.componentsDivider25),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const Divider(),
                            Container(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12.0,
                                horizontal: 24.0,
                              ),
                              child: const Text(or),
                            )
                          ],
                        ),
                        const SizedBox(height: Dimens.componentsDivider25),
                        WordlesButton(
                          text: random,
                          onPressed: () => AutoRouter.of(context).push(GameRoute(word: WordsManager.randomWord)),
                        ),
                        const SizedBox(height: Dimens.componentsDivider),
                        Consumer<WordleOfTheDayProvider>(builder: (context, provider, child) {
                          return Column(
                            children: [
                              provider.state == ViewState.busy
                                  ? const Center(child: CircularProgressIndicator())
                                  : WordlesButton(
                                      text: wordleOfTheDay,
                                      onPressed: () => provider.goWordleOfTheDay(context),
                                    ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              Consumer<CreateWordlesProvider>(builder: (context, provider, child) {
                return Column(
                  children: [
                    WordlesAlertDialog(
                      show: provider.error,
                      title: eCreatingWordle,
                      message: eCreatingWordleMessage,
                      primaryButtonText: ok,
                      onPrimaryPressed: () => provider.dissmissError(),
                    ),
                    WordlesAlertDialog(
                      show: provider.wordleURL != null,
                      title: successCreatingWordle,
                      message: successCreatingWordleMessage,
                      primaryButtonText: ok,
                      onPrimaryPressed: () {
                        _nameEditingController.text = emptyString;
                        _wordEditingController.text = emptyString;
                        provider.dissmissSuccess();
                      },
                      secondaryButtonText: share,
                      onSecondaryPressed: () => ShareUtils.share(provider.wordleURL!.toString()),
                    ),
                  ],
                );
              }),
              Consumer<WordleOfTheDayProvider>(builder: (context, provider, child) {
                return Column(
                  children: [
                    WordlesAlertDialog(
                      show: provider.error,
                      title: eWordleOfTheDay,
                      message: eWordleOfTheDayMessage,
                      primaryButtonText: ok,
                      onPrimaryPressed: () => provider.dissmissError(),
                    ),
                  ],
                );
              }),
            ],
          )),
    );
  }
}
