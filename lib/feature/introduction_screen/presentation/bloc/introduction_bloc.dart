import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/feature/introduction_screen/domain/entities/introduction_page_entity.dart';
import '../../domain/repositories/introduction_repository.dart';
import 'introduction_event.dart';
import 'introduction_state.dart';

class IntroductionBloc extends Bloc<IntroductionEvent, IntroductionState> {
  final IntroductionRepository _repository;

  IntroductionBloc(this._repository) : super(const IntroductionState.initial()) {
    on<IntroductionEvent>(_onEvent);
  }

  void _onEvent(IntroductionEvent event, Emitter<IntroductionState> emit) {
    event.map(
      loadPages: (_) => _onLoadPages(emit),
      nextPage: (_) => _onNextPage(emit),
      previousPage: (_) => _onPreviousPage(emit),
      pageChanged: (e) => _onPageChanged(e.page, emit),
      skip: (_) => _onSkipIntroduction(emit),
      complete: (_) => _onCompleteIntroduction(emit),
    );
  }

  void _onLoadPages(Emitter<IntroductionState> emit) {
    final pages = _repository.getIntroductionPages();
    emit(IntroductionState.loaded(
      pages: pages,
      currentPage: 0,
      isLastPage: pages.length == 1,
      isFirstPage: true,
    ));
  }

  void _onNextPage(Emitter<IntroductionState> emit) {
    state.mapOrNull(
      initial: (s) => _emitPageChange(s.currentPage + 1, s.pages, emit),
      loading: (s) => _emitPageChange(s.currentPage + 1, s.pages, emit),
      loaded: (s) => _emitPageChange(s.currentPage + 1, s.pages, emit),
    );
  }

  void _onPreviousPage(Emitter<IntroductionState> emit) {
    state.mapOrNull(
      initial: (s) => _emitPageChange(s.currentPage - 1, s.pages, emit),
      loading: (s) => _emitPageChange(s.currentPage - 1, s.pages, emit),
      loaded: (s) => _emitPageChange(s.currentPage - 1, s.pages, emit),
    );
  }

  void _onPageChanged(int page, Emitter<IntroductionState> emit) {
    state.mapOrNull(
      initial: (s) => _emitPageChange(page, s.pages, emit),
      loading: (s) => _emitPageChange(page, s.pages, emit),
      loaded: (s) => _emitPageChange(page, s.pages, emit),
    );
  }

  void _emitPageChange(int newPage, List<IntroductionPageEntity> pages, Emitter<IntroductionState> emit) {
    if (newPage >= 0 && newPage < pages.length) {
      emit(IntroductionState.loaded(
        pages: pages,
        currentPage: newPage,
        isLastPage: newPage == pages.length - 1,
        isFirstPage: newPage == 0,
      ));
    }
  }

  void _onSkipIntroduction(Emitter<IntroductionState> emit) {
    state.mapOrNull(
      initial: (s) => _emitLastPage(s.pages, emit),
      loading: (s) => _emitLastPage(s.pages, emit),
      loaded: (s) => _emitLastPage(s.pages, emit),
    );
  }

  void _emitLastPage(List<IntroductionPageEntity> pages, Emitter<IntroductionState> emit) {
    final lastPage = pages.length - 1;
    emit(IntroductionState.loaded(
      pages: pages,
      currentPage: lastPage,
      isLastPage: true,
      isFirstPage: false,
    ));
  }

  Future<void> _onCompleteIntroduction(Emitter<IntroductionState> emit) async {
    await _repository.setIntroductionCompleted();
    emit(const IntroductionState.completed());
  }
}
