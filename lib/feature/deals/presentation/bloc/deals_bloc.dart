import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mitho_deals/feature/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/feature/deals/domain/repo/deal_repository.dart';
import 'package:mitho_deals/feature/deals/domain/usecases/add_deals.dart';
import 'package:mitho_deals/feature/deals/domain/usecases/get_available_deals.dart';
import 'deals_event.dart';
import 'deals_state.dart';



class DealsBloc extends Bloc<DealsEvent, DealsState> {
  final GetAvailableDealsUseCase getAvailableDealsUseCase;
  final AddDealUseCase addDealUseCase;
  final DealRepository dealRepository;

  DealsBloc({
    required this.getAvailableDealsUseCase,
    required this.addDealUseCase,
    required this.dealRepository,
  }) : super(const DealsState.initial()) {
    on<LoadDeals>((event, emit) async {
      emit(const DealsState.loading());
      try {
        final deals = await getAvailableDealsUseCase();
        emit(DealsState.loaded(deals));
      } catch (e) {
        emit(DealsState.error(e.toString()));
      }
    });

    on<AddDeal>((event, emit) async {
      emit(const DealsState.addingDeal());
      try {
        await addDealUseCase(event.deal, event.imageFile);
        emit(const DealsState.addDealSuccess());
        // Refresh deals list
        final deals = await getAvailableDealsUseCase();
        emit(DealsState.loaded(deals));
      } catch (e) {
        emit(DealsState.addDealError(e.toString()));
      }
    });

    on<ClaimDeal>((event, emit) async {
      try {
        await dealRepository.claimDeal(event.dealId, event.quantity);
        emit(const DealsState.claimedSuccess());
        final deals = await getAvailableDealsUseCase();
        emit(DealsState.loaded(deals));
      } catch (e) {
        emit(DealsState.claimedError(e.toString()));
      }
    });
  }
}
