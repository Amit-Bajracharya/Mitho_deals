import 'package:flutter_bloc/flutter_bloc.dart';

part 'introduction_event.dart';
part 'introduction_state.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  IntroductionBloc() : super(const IntroductionState()) {
    on<NextPageEvent>(_onNextPage);
    on<PreviousPageEvent>(_onPreviousPage);
    on<PageChangedEvent>(_onPageChanged);
    on<SkipIntroductionEvent>(_onSkipIntroduction);
  }

  void _onNextPage(NextPageEvent event, Emitter<IntroductionState> emit) {
    final nextPage = state.currentPage + 1;
    if (nextPage <= 2) {
      emit(state.copyWith(
        currentPage: nextPage,
        isLastPage: nextPage == 2,
        isFirstPage: nextPage == 0,
      ));
    }
  }

  void _onPreviousPage(PreviousPageEvent event, Emitter<IntroductionState> emit) {
    final prevPage = state.currentPage - 1;
    if (prevPage >= 0) {
      emit(state.copyWith(
        currentPage: prevPage,
        isLastPage: prevPage == 2,
        isFirstPage: prevPage == 0,
      ));
    }
  }

  void _onPageChanged(PageChangedEvent event, Emitter<IntroductionState> emit) {
    emit(state.copyWith(
      currentPage: event.page,
      isLastPage: event.page == 2,
      isFirstPage: event.page == 0,
    ));
  }

  void _onSkipIntroduction(SkipIntroductionEvent event, Emitter<IntroductionState> emit) {
    emit(state.copyWith(
      currentPage: 2,
      isLastPage: true,
      isFirstPage: false,
    ));
  }
}
