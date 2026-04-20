import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/feature/deals/domain/repo/deal_repository.dart';
import 'package:mitho_deals/feature/deals/domain/usecases/add_deals.dart';
import 'package:mitho_deals/feature/deals/domain/usecases/get_available_deals.dart';
import 'package:mitho_deals/feature/deals/domain/usecases/get_vendor_deals.dart';
import 'deals_event.dart';
import 'deals_state.dart';



class DealsBloc extends Bloc<DealsEvent, DealsState> {
  final GetAvailableDealsUseCase getAvailableDealsUseCase;
  final AddDealUseCase addDealUseCase;
  final GetVendorDealsUseCase getVendorDealsUseCase;
  final DealRepository dealRepository;

  DealsBloc({
    required this.getAvailableDealsUseCase,
    required this.addDealUseCase,
    required this.getVendorDealsUseCase,
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

    on<LoadVendorDeals>((event, emit) async {
      emit(const DealsState.vendorDealsLoading());
      try {
        final deals = await getVendorDealsUseCase();
        emit(DealsState.vendorDealsLoaded(deals));
      } catch (e) {
        emit(DealsState.vendorDealsError(e.toString()));
      }
    });
  }
}
