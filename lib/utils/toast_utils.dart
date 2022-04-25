import 'package:fluttertoast/fluttertoast.dart';
import 'package:wordles/styles/text_styles.dart';
import 'package:wordles/values/colors.dart';

class ToastUtils {
  static void showSimpleToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: darkColor,
      textColor: lightColor,
      fontSize: TextStyles.fontSize16,
    );
  }
}
