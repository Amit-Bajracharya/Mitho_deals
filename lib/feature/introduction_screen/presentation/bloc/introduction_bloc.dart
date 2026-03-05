import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/introduction_repository.dart';

part 'introduction_event.dart';
part 'introduction_state.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  final IntroductionRepository _repository;

  IntroductionBloc(this._repository) : super(const IntroductionState()) {
    on<LoadIntroductionPagesEvent>(_onLoadPages);
    on<NextPageEvent>(_onNextPage);
    on<PreviousPageEvent>(_onPreviousPage);
    on<PageChangedEvent>(_onPageChanged);
    on<SkipIntroductionEvent>(_onSkipIntroduction);
    on<CompleteIntroductionEvent>(_onCompleteIntroduction);
  }

  void _onLoadPages(LoadIntroductionPagesEvent event, Emitter<IntroductionState> emit) {
    final pages = _repository.getIntroductionPages();
    emit(state.copyWith(
      pages: pages,
      isLoading: false,
      isLastPage: pages.length == 1,
    ));
  }

  void _onNextPage(NextPageEvent event, Emitter<IntroductionState> emit) {
    final nextPage = state.currentPage + 1;
    if (nextPage < state.pages.length) {
      emit(state.copyWith(
        currentPage: nextPage,
        isLastPage: nextPage == state.pages.length - 1,
        isFirstPage: nextPage == 0,
      ));
    }
  }

  void _onPreviousPage(PreviousPageEvent event, Emitter<IntroductionState> emit) {
    final prevPage = state.currentPage - 1;
    if (prevPage >= 0) {
      emit(state.copyWith(
        currentPage: prevPage,
        isLastPage: prevPage == state.pages.length - 1,
        isFirstPage: prevPage == 0,
      ));
    }
  }

  void _onPageChanged(PageChangedEvent event, Emitter<IntroductionState> emit) {
    emit(state.copyWith(
      currentPage: event.page,
      isLastPage: event.page == state.pages.length - 1,
      isFirstPage: event.page == 0,
    ));
  }

  void _onSkipIntroduction(SkipIntroductionEvent event, Emitter<IntroductionState> emit) {
    final lastPage = state.pages.length - 1;
    emit(state.copyWith(
      currentPage: lastPage,
      isLastPage: true,
      isFirstPage: false,
    ));
  }

  Future<void> _onCompleteIntroduction(CompleteIntroductionEvent event, Emitter<IntroductionState> emit) async {
    await _repository.setIntroductionCompleted();
    emit(state.copyWith(isIntroductionCompleted: true));
  }
}
