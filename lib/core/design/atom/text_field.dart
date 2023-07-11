import 'package:flutter/material.dart';
import 'package:three_screeens/core/design/style/text_style.dart';

import '../decoration/base_color.dart';

class BaseTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? prefixIconPath;
  final bool enabled;
  final bool isRequired;
  final String? errorMsg;
  final double outerVerticalPadding;

  const BaseTextField({
    required this.hint,
    required this.controller,
    this.onChanged,
    this.errorMsg,
    this.prefixIconPath,
    this.enabled = true,
    this.isRequired = false,
    this.outerVerticalPadding = 16,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 32,
        vertical: outerVerticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
              color: BaseColors.white,
              border: Border.all(
                color: BaseColors.lightGrey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                cursorColor: BaseColors.black,
                controller: controller,
                onChanged: onChanged,
                style: BaseTextStyle.blackH3(),
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: BaseTextStyle.grayInput(),
                  border: InputBorder.none,
                  filled: false,
                ),
                enabled: enabled,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
