import 'package:flutter/material.dart';
import 'package:wordles/common_ui_components/board/board_row.dart';
import 'package:wordles/model/wordle_model.dart';

class Board extends StatelessWidget {
  final WordleModel model;

  const Board({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        color: Theme.of(context).scaffoldBackgroundColor,
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.height * 0.5,
          maxHeight: MediaQuery.of(context).size.height * 0.59,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(children: model.rows.map((row) => BoardRow(row: row)).toList()),
      ),
    );
  }
}
