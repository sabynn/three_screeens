import 'package:flutter/material.dart';

import '../decoration/base_color.dart';
import '../style/text_style.dart';

class BaseToast {
  static show({
    required BuildContext context,
    String? text,
    String? action,
    Function()? onTap,
    Duration duration = const Duration(seconds: 1),
    BaseToastStyle style = BaseToastStyle.normal,
  }) {
    Color bgColor = BaseColors.lightGrey;
    if (style == BaseToastStyle.success) {
      bgColor = BaseColors.green;
    } else if (style == BaseToastStyle.error) {
      bgColor = BaseColors.red;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text ?? '',
          style: BaseTextStyle.whiteRegular(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: bgColor,
      ),
    );
  }
}

enum BaseToastStyle { normal, success, error }
