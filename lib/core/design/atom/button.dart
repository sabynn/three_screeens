import 'package:flutter/material.dart';

import '../decoration/base_color.dart';
import '../style/text_style.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Function? onTap;
  final bool? isLoading;
  final bool? isDisabled;
  final double innerVerticalPadding;
  final double outerVerticalPadding;
  final double outerHorizontalPadding;

  const BaseButton({
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.isDisabled = false,
    this.innerVerticalPadding = 12,
    this.outerVerticalPadding = 16,
    this.outerHorizontalPadding = 32,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        horizontal: outerHorizontalPadding,
        vertical: outerVerticalPadding,
      ),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                if (!isLoading! && !isDisabled!) {
                  onTap!();
                }
              },
              child: Opacity(
                opacity: isDisabled! ? 0.5 : 1,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: innerVerticalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: BaseColors.primary,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  width: double.infinity,
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: BaseTextStyle.whiteRegular(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
