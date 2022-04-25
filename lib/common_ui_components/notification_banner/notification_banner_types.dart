import 'package:flutter/material.dart';
import 'package:wordles/values/colors.dart';

enum NotificationBannerType {
  info,
  error,
  warning,
}

extension NotificationBannerTypeExtension on NotificationBannerType {
  Color get backgroundColor {
    switch (this) {
      case NotificationBannerType.info:
        return blue;

      case NotificationBannerType.error:
        return red;

      case NotificationBannerType.warning:
        return yellow;
    }
  }
}
