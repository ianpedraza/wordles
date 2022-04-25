import 'package:flutter/material.dart';
import 'package:wordles/values/colors.dart';

enum CharacterStatus {
  notIn,
  inWordle,
  atPosition,
}

extension CharacterStatusExtension on CharacterStatus {
  Color get color {
    switch (this) {
      case CharacterStatus.notIn:
        return wordleGrey;

      case CharacterStatus.inWordle:
        return wordleYellow;

      case CharacterStatus.atPosition:
        return wordleGreen;
    }
  }

  String get name {
    switch (this) {
      case CharacterStatus.notIn:
        return "not-in";

      case CharacterStatus.inWordle:
        return "in-wordle";

      case CharacterStatus.atPosition:
        return "at-position";
    }
  }

  String get emoji {
    switch (this) {
      case CharacterStatus.notIn:
        return "⬜";

      case CharacterStatus.inWordle:
        return "🟨";

      case CharacterStatus.atPosition:
        return "🟩";
    }
  }
}
