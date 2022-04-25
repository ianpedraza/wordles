import 'package:wordles/common_ui_components/keyboard/key_model.dart';
import 'package:wordles/model/character_status.dart';
import 'package:wordles/utils/icons.dart';
import 'package:wordles/values/strings.dart';

class KeyboardModel {
  final List<KeyModel> _row1 = [
    KeyModel(value: "Q"),
    KeyModel(value: "W"),
    KeyModel(value: "E"),
    KeyModel(value: "R"),
    KeyModel(value: "T"),
    KeyModel(value: "Y"),
    KeyModel(value: "U"),
    KeyModel(value: "I"),
    KeyModel(value: "O"),
    KeyModel(value: "P"),
  ];

  final List<KeyModel> _row2 = [
    KeyModel(value: "A"),
    KeyModel(value: "S"),
    KeyModel(value: "D"),
    KeyModel(value: "F"),
    KeyModel(value: "G"),
    KeyModel(value: "H"),
    KeyModel(value: "J"),
    KeyModel(value: "K"),
    KeyModel(value: "L"),
    KeyModel(value: "Ñ"),
  ];

  final List<KeyModel> _row3 = [
    KeyModel(value: enterKey, flex: 2),
    KeyModel(value: "Z"),
    KeyModel(value: "X"),
    KeyModel(value: "C"),
    KeyModel(value: "V"),
    KeyModel(value: "B"),
    KeyModel(value: "N"),
    KeyModel(value: "M"),
    KeyModel(value: deleteKey, flex: 2, icon: AppIcons.deleteOutlined)
  ];

  List<KeyModel> get row1 => _row1;
  List<KeyModel> get row2 => _row2;
  List<KeyModel> get row3 => _row3;

  void changeStatus(String value, CharacterStatus status) {
    if (value == deleteKey || value == enterKey) return;

    bool found = false;

    for (var e in _row1) {
      if (e.value == value) {
        found = true;
        e.changeStatus(status);
        break;
      }
    }

    if (found) return;

    for (var e in _row2) {
      if (e.value == value) {
        found = true;
        e.changeStatus(status);
        break;
      }
    }

    if (found) return;

    for (var e in _row3) {
      if (e.value == value) {
        e.changeStatus(status);
        break;
      }
    }
  }
}
