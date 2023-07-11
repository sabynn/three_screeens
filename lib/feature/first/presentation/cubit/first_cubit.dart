import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constant/preferences_keys.dart';
import '../../../../services/shared_preferences.dart';

part 'first_state.dart';

@injectable
class FirstCubit extends Cubit<FirstState> {
  FirstCubit() : super(const FirstState());

  void checkPalindrome({
    required String sentence,
  }) {
    emit(
      state.copyWith(
        message: '',
      ),
    );

    String sentenceReplaced = sentence.replaceAll(' ', '').toLowerCase();

    bool isPalindrome =
        sentenceReplaced == sentenceReplaced.split('').reversed.join('');

    emit(
      state.copyWith(
        message: isPalindrome ? 'is palindrome' : 'not palindrome',
        isPalindrome: isPalindrome,
        nameIsSaved: false,
      ),
    );
  }

  void saveName({
    required String name,
  }) async {
    emit(
      state.copyWith(message: '', nameIsSaved: false),
    );

    await SharedPreferencesService.saveString(
      PreferencesKeys.name,
      name,
    );

    emit(
      state.copyWith(message: '', nameIsSaved: true),
    );
  }
}
