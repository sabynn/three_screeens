import 'package:flutter/material.dart';
import 'package:three_screeens/core/design/style/text_style.dart';

import '../decoration/base_color.dart';

class BaseScaffold extends StatelessWidget {
  final Widget body;
  final Color backgroundColor;
  final bool resizeToAvoidBottomInset;
  final bool withAppBar;
  final String appBarTitle;
  final String? backRoute;
  final bool safeArea;
  final bool padding;

  const BaseScaffold({
    required this.body,
    this.backgroundColor = BaseColors.white,
    this.resizeToAvoidBottomInset = false,
    this.safeArea = true,
    this.padding = true,
    this.withAppBar = false,
    this.appBarTitle = '',
    this.backRoute,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final content = padding
        ? Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 20,
            ),
            child: body,
          )
        : body;
    return Scaffold(
      appBar: withAppBar
          ? AppBar(
              elevation: 1,
              surfaceTintColor: BaseColors.white,
              shadowColor: BaseColors.white,
              leading: IconButton(
                onPressed: () {
                  backRoute != null
                      ? Navigator.popUntil(
                          context,
                          ModalRoute.withName(backRoute!),
                        )
                      : Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.chevron_left,
                  color: BaseColors.strongBlue,
                ),
              ),
              title: Text(
                appBarTitle,
                style: BaseTextStyle.blackH2(),
              ),
              centerTitle: true,
            )
          : null,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      body: safeArea
          ? SafeArea(
              child: content,
            )
          : content,
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}
