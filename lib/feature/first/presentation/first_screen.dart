import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:three_screeens/core/design/atom/button.dart';

import '../../../core/constant/base_route.dart';
import '../../../core/design/atom/text_field.dart';
import '../../../core/design/atom/toast.dart';
import '../../../core/design/decoration/assets.dart';
import '../../../core/design/layout/base_scaffold.dart';
import '../../../core/design/layout/screen_size.dart';
import '../../../services/di.dart';
import 'cubit/first_cubit.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late final TextEditingController nameController;
  late final TextEditingController palindromeController;
  late final FirstCubit _firstCubit;

  @override
  void initState() {
    nameController = TextEditingController();
    palindromeController = TextEditingController();
    _firstCubit = get<FirstCubit>();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    palindromeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _firstCubit,
      child: BaseScaffold(
        padding: false,
        body: BlocListener<FirstCubit, FirstState>(
          listener: (BuildContext context, state) {
            if (state.message != '') {
              BaseToast.show(
                text: state.message,
                style: state.isPalindrome
                    ? BaseToastStyle.success
                    : BaseToastStyle.error,
                context: context,
              );
            }

            if (state.nameIsSaved) {
              Navigator.pushNamed(context, BaseRoute.secondScreen);
            }
          },
          child: Container(
            constraints: const BoxConstraints.expand(),
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.background),
                fit: BoxFit.cover,
              ),
            ),
            child: SizedBox(
              height: ScreenSize.height(context),
              child: ListView(
                children: [
                  SizedBox(height: ScreenSize.percentHeight(context, 20)),
                  Image.asset(
                    Assets.profile,
                    width: 116,
                    height: 116,
                  ),
                  const SizedBox(height: 32),
                  BaseTextField(
                    hint: 'Name',
                    controller: nameController,
                  ),
                  BaseTextField(
                    hint: 'Palindrome',
                    controller: palindromeController,
                    outerVerticalPadding: 0,
                  ),
                  const SizedBox(height: 45),
                  BaseButton(
                    text: 'CHECK',
                    onTap: () {
                      _firstCubit.checkPalindrome(
                        sentence: palindromeController.text,
                      );
                    },
                  ),
                  BaseButton(
                    text: 'NEXT',
                    onTap: () {
                      _firstCubit.saveName(
                        name: nameController.text,
                      );
                    },
                    outerVerticalPadding: 0,
                  ),
                  SizedBox(height: ScreenSize.percentHeight(context, 20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
