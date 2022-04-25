import 'package:wordles/model/worddle_row_model.dart';

class WordleModel {
  List<WordleRowModel> rows;

  WordleModel({this.rows = const []}) {
    if (rows.isEmpty) {
      rows = List<WordleRowModel>.generate(
        6,
        (_) => WordleRowModel(),
        growable: false,
      );
    }
  }
}
