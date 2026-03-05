part of 'introduction_bloc.dart';

class IntroductionState {
  final int currentPage;
  final bool isLastPage;
  final bool isFirstPage;
  final bool isLoading;
  final List<dynamic> pages;
  final bool isIntroductionCompleted;

  const IntroductionState({
    this.currentPage = 0,
    this.isLastPage = false,
    this.isFirstPage = true,
    this.isLoading = false,
    this.pages = const [],
    this.isIntroductionCompleted = false,
  });

  IntroductionState copyWith({
    int? currentPage,
    bool? isLastPage,
    bool? isFirstPage,
    bool? isLoading,
    List<dynamic>? pages,
    bool? isIntroductionCompleted,
  }) {
    return IntroductionState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      isFirstPage: isFirstPage ?? this.isFirstPage,
      isLoading: isLoading ?? this.isLoading,
      pages: pages ?? this.pages,
      isIntroductionCompleted: isIntroductionCompleted ?? this.isIntroductionCompleted,
    );
  }
}
