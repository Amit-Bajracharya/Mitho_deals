import 'package:freezed_annotation/freezed_annotation.dart';

part 'introduction_event.freezed.dart';

@freezed
class IntroductionEvent with _$IntroductionEvent {
  const factory IntroductionEvent.loadPages() = LoadIntroductionPagesEvent;
  const factory IntroductionEvent.nextPage() = NextPageEvent;
  const factory IntroductionEvent.previousPage() = PreviousPageEvent;
  const factory IntroductionEvent.pageChanged(int page) = PageChangedEvent;
  const factory IntroductionEvent.skip() = SkipIntroductionEvent;
  const factory IntroductionEvent.complete() = CompleteIntroductionEvent;
}
