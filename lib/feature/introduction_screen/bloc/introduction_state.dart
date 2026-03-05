part of 'introduction_bloc.dart';

class IntroductionState {
  final int currentPage;
  final bool isLastPage;
  final bool isFirstPage;

  const IntroductionState({
    this.currentPage = 0,
    this.isLastPage = false,
    this.isFirstPage = true,
  });

  IntroductionState copyWith({
    int? currentPage,
    bool? isLastPage,
    bool? isFirstPage,
  }) {
    return IntroductionState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      isFirstPage: isFirstPage ?? this.isFirstPage,
    );
  }
}
