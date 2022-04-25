import 'package:flutter/material.dart';
import 'package:wordles/common_ui_components/notification_banner/notification_banner_types.dart';
import 'package:wordles/styles/text_styles.dart';

class NotificationBanner extends StatelessWidget {
  final NotificationBannerType type;
  final String? message;

  const NotificationBanner({
    Key? key,
    this.message,
    this.type = NotificationBannerType.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      top: message != null ? 10.0 : 0.0,
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 100),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: message != null
            ? Material(
                elevation: 20.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                  decoration: BoxDecoration(
                    color: type.backgroundColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    message!,
                    style: TextStyles(context).baseRegular16Text.copyWith(
                          color: type == NotificationBannerType.warning ? Colors.black : Colors.white,
                        ),
                  ),
                ),
              )
            : Container(),
      ),
    );
  }
}
