import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/introduction_page_entity.dart';

part 'introduction_state.freezed.dart';

@freezed
class IntroductionState with _$IntroductionState {
  const factory IntroductionState.initial({
    @Default(0) int currentPage,
    @Default(false) bool isLastPage,
    @Default(true) bool isFirstPage,
    @Default([]) List<IntroductionPageEntity> pages,
  }) = IntroductionStateInitial;

  const factory IntroductionState.loading({
    @Default(0) int currentPage,
    @Default(false) bool isLastPage,
    @Default(true) bool isFirstPage,
    @Default([]) List<IntroductionPageEntity> pages,
  }) = IntroductionStateLoading;

  const factory IntroductionState.loaded({
    required List<IntroductionPageEntity> pages,
    @Default(0) int currentPage,
    @Default(false) bool isLastPage,
    @Default(true) bool isFirstPage,
  }) = IntroductionStateLoaded;

  const factory IntroductionState.completed() = IntroductionStateCompleted;
}
