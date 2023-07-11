import 'package:flutter/material.dart';
import 'package:three_screeens/core/design/style/text_style.dart';
import 'package:three_screeens/services/shared_preferences.dart';

import '../../../core/constant/base_route.dart';
import '../../../core/constant/preferences_keys.dart';
import '../../../core/design/atom/button.dart';
import '../../../core/design/layout/base_scaffold.dart';
import '../../../core/design/layout/screen_size.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      withAppBar: true,
      appBarTitle: 'Second Screen',
      body: SizedBox(
        height: ScreenSize.height(context),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: BaseTextStyle.blackH5(),
                  ),
                  Text(
                    SharedPreferencesService.getString(
                          PreferencesKeys.name,
                        ) ??
                        '',
                    style: BaseTextStyle.blackH2(),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  SharedPreferencesService.getString(
                        PreferencesKeys.selectedUser,
                      ) ??
                      'Selected User Name',
                  style: BaseTextStyle.blackH1(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BaseButton(
                text: 'Choose a User',
                onTap: () {
                  Navigator.pushNamed(context, BaseRoute.thirdScreen);
                },
                outerVerticalPadding: 8,
                outerHorizontalPadding: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
