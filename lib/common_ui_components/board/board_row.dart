import 'package:flutter/material.dart';
import 'package:wordles/common_ui_components/board/row_character.dart';
import 'package:wordles/model/worddle_row_model.dart';

class BoardRow extends StatelessWidget {
  final WordleRowModel row;

  const BoardRow({
    Key? key,
    required this.row,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: row.characters.map((characters) => RowCharacter(character: characters)).toList(),
    );
  }
}
