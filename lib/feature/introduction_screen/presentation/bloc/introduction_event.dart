part of 'introduction_bloc.dart';

sealed class IntroductionEvent {}

class NextPageEvent extends IntroductionEvent {}

class PreviousPageEvent extends IntroductionEvent {}

class SkipIntroductionEvent extends IntroductionEvent {}

class PageChangedEvent extends IntroductionEvent {
  final int page;
  PageChangedEvent(this.page);
}

class LoadIntroductionPagesEvent extends IntroductionEvent {}

class CompleteIntroductionEvent extends IntroductionEvent {}
