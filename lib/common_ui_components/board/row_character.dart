import 'package:flutter/material.dart';
import 'package:wordles/model/character_status.dart';
import 'package:wordles/model/wordle_character_model.dart';
import 'package:wordles/styles/text_styles.dart';
import 'package:wordles/values/colors.dart';

class RowCharacter extends StatelessWidget {
  final WordleCharacterModel character;

  const RowCharacter({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasStatus = character.status != null;

    return Expanded(
      flex: 1,
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(
            decoration: BoxDecoration(
              color: character.status?.color ?? Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(2.0),
              border: hasStatus ? null : Border.all(color: wordleGrey, width: 2.0),
            ),
            child: Center(
              child: Text(
                character.value,
                style: TextStyles(context).boardRegular32Text.copyWith(
                      color: hasStatus ? lightColor : Theme.of(context).textTheme.bodyText1?.color,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
