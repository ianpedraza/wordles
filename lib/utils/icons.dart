import 'package:flutter/material.dart';

final _icons = <AppIcons, IconData>{
  AppIcons.deleteOutlined: Icons.backspace_outlined,
  AppIcons.enterOutlined: Icons.check_circle_outline,
  AppIcons.backArrowIOS: Icons.arrow_back_ios,
  AppIcons.backArrowAndroid: Icons.arrow_back,
  AppIcons.helpOutlined: Icons.help_outline_outlined,
};

Icon getIcon(AppIcons name, {Color? color, double? size}) {
  return Icon(
    _icons[name],
    color: color,
    size: size,
  );
}

enum AppIcons {
  backArrowIOS,
  backArrowAndroid,

  deleteOutlined,
  enterOutlined,
  helpOutlined,
}
