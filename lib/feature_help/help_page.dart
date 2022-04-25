import 'package:flutter/material.dart';
import 'package:wordles/common_ui_components/board/board_row.dart';
import 'package:wordles/common_ui_components/wordles_drawer/wordles_drawer.dart';
import 'package:wordles/common_ui_components/wordles_app_bar.dart';
import 'package:wordles/model/character_status.dart';
import 'package:wordles/model/worddle_row_model.dart';
import 'package:wordles/model/wordle_character_model.dart';
import 'package:wordles/styles/text_styles.dart';
import 'package:wordles/values/dimens.dart';
import 'package:wordles/values/strings.dart';

class HelpPage extends StatelessWidget {
  HelpPage({Key? key}) : super(key: key);

  late final example1 = [
    WordleCharacterModel(value: "F", status: CharacterStatus.atPosition),
    WordleCharacterModel(value: "R"),
    WordleCharacterModel(value: "E"),
    WordleCharacterModel(value: "S"),
    WordleCharacterModel(value: "A"),
  ];

  late final WordleRowModel _wordleRowModel1 = WordleRowModel(characters: example1);

  late final example2 = [
    WordleCharacterModel(value: "A"),
    WordleCharacterModel(value: "D"),
    WordleCharacterModel(value: "I", status: CharacterStatus.inWordle),
    WordleCharacterModel(value: "O"),
    WordleCharacterModel(value: "S"),
  ];

  late final WordleRowModel _wordleRowModel2 = WordleRowModel(characters: example2);

  late final example3 = [
    WordleCharacterModel(value: "L"),
    WordleCharacterModel(value: "E"),
    WordleCharacterModel(value: "T"),
    WordleCharacterModel(value: "R"),
    WordleCharacterModel(value: "A", status: CharacterStatus.notIn),
  ];

  late final WordleRowModel _wordleRowModel3 = WordleRowModel(characters: example3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WordlesAppBar(
        backArrow: true,
        showHelp: false,
      ),
      endDrawer: const WordlesDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            constraints: const BoxConstraints(maxWidth: Dimens.maxWidth),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5.0),
                Center(
                  child: Text(
                    howToPlay,
                    style: TextStyles(context).baseBold24Text,
                  ),
                ),
                const SizedBox(height: Dimens.componentsDivider),
                Text(
                  howToPlay1,
                  style: TextStyles(context).baseRegular18Text,
                ),
                const SizedBox(height: Dimens.componentsDivider),
                Text(
                  howToPlay2,
                  style: TextStyles(context).baseRegular18Text,
                ),
                const SizedBox(height: Dimens.componentsDivider),
                Text(
                  howToPlay3,
                  style: TextStyles(context).baseRegular18Text,
                ),
                const SizedBox(height: Dimens.componentsDivider),
                Text(
                  examples,
                  style: TextStyles(context).baseBold18Text,
                ),
                const SizedBox(height: Dimens.componentsDivider),
                BoardRow(row: _wordleRowModel1),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: "$theLetter ",
                    style: TextStyles(context).baseRegular18Text,
                    children: <TextSpan>[
                      TextSpan(
                        text: "${_wordleRowModel1.characters[0].value} ",
                        style: TextStyles(context).baseBold18Text,
                      ),
                      TextSpan(
                        text: isAt,
                        style: TextStyles(context).baseRegular18Text,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.componentsDivider),
                BoardRow(row: _wordleRowModel2),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: "$theLetter ",
                    style: TextStyles(context).baseRegular18Text,
                    children: <TextSpan>[
                      TextSpan(
                        text: "${_wordleRowModel2.characters[2].value} ",
                        style: TextStyles(context).baseBold18Text,
                      ),
                      TextSpan(
                        text: isIn,
                        style: TextStyles(context).baseRegular18Text,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.componentsDivider),
                BoardRow(row: _wordleRowModel3),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: "$theLetter ",
                    style: TextStyles(context).baseRegular18Text,
                    children: <TextSpan>[
                      TextSpan(
                        text: "${_wordleRowModel3.characters[4].value} ",
                        style: TextStyles(context).baseBold18Text,
                      ),
                      TextSpan(
                        text: isNot,
                        style: TextStyles(context).baseRegular18Text,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.componentsDivider),
                Text(
                  howToPlay4,
                  style: TextStyles(context).baseRegular18Text,
                ),
                const SizedBox(height: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
