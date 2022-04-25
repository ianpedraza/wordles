import 'package:wordles/model/character_status.dart';
import 'package:wordles/utils/icons.dart';

class KeyModel {
  String value;
  CharacterStatus? status;
  AppIcons? icon;
  int flex;

  KeyModel({
    required this.value,
    this.status,
    this.icon,
    this.flex = 1,
  });
}

extension KeyModelExtension on KeyModel {
  void changeStatus(CharacterStatus status) {
    if (this.status == null) {
      this.status = status;
      return;
    }

    if (this.status == CharacterStatus.inWordle && status == CharacterStatus.atPosition) {
      this.status = status;
      return;
    }
  }
}
