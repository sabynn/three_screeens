part of 'first_cubit.dart';

class FirstState extends Equatable {
  final String message;
  final bool nameIsSaved;
  final bool isPalindrome;

  const FirstState({
    this.message = '',
    this.nameIsSaved = false,
    this.isPalindrome = false,
  });

  FirstState copyWith({
    String? message,
    bool? nameIsSaved,
    bool? isPalindrome,
  }) {
    return FirstState(
      isPalindrome: isPalindrome ?? this.isPalindrome,
      message: message ?? this.message,
      nameIsSaved: nameIsSaved ?? this.nameIsSaved,
    );
  }

  @override
  List<Object> get props => [isPalindrome, message, nameIsSaved];
}