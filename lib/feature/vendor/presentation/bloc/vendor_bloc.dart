import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/vendor_stats.dart';
import '../../../orders/domain/entity/order_entity.dart';
import '../../domain/usecases/get_vendor_dashboard_stats.dart';
import '../../domain/usecases/vendor_orders_usecase.dart';
import '../../domain/usecases/confirm_pickup_usecase.dart';
import '../../domain/usecases/update_shop_status_usecase.dart';
import '../../../../core/errors/failures.dart';

part 'vendor_event.dart';
part 'vendor_state.dart';
part 'vendor_bloc.freezed.dart';

class VendorBloc extends Bloc<VendorEvent, VendorState> {
  final GetVendorDashboardStatsUseCase getDashboardStats;
  final GetVendorOrdersUseCase getActiveOrders;
  final ConfirmPickupUseCase confirmPickup;
  final UpdateShopStatusUseCase updateShopStatus;

  VendorBloc({
    required this.getDashboardStats,
    required this.getActiveOrders,
    required this.confirmPickup,
    required this.updateShopStatus,
  }) : super(const VendorState.initial()) {
    on<VendorEvent>((event, emit) async {
      await event.when(
        loadDashboard: () async => await _loadDashboard(emit),
        refreshData: () async => await _refreshData(emit),
        fulfillOrder: (pickupCode) async => await _fulfillOrder(pickupCode, emit),
        updateShopStatus: (isOpen) async => await _updateShopStatus(isOpen, emit),
      );
    });
  }

  Future<void> _loadDashboard(Emitter<VendorState> emit) async {
    emit(const VendorState.loading());
    
    final results = await Future.wait([
      getDashboardStats(),
      getActiveOrders(),
    ]);

    final statsResult = results[0] as Either<Failure, VendorStats>;
    final ordersResult = results[1] as Either<Failure, List<OrderEntity>>;

    statsResult.fold(
      (failure) => emit(VendorState.error(failure.message)),
      (stats) {
        ordersResult.fold(
          (failure) => emit(VendorState.error(failure.message)),
          (orders) => emit(VendorState.loaded(stats: stats, orders: orders)),
        );
      },
    );
  }

  Future<void> _refreshData(Emitter<VendorState> emit) async {
    if (state.maybeWhen(loaded: (stats, orders) => true, orElse: () => false)) {
      final currentStats = state.whenOrNull(loaded: (stats, orders) => stats);
      final currentOrders = state.whenOrNull(loaded: (stats, orders) => orders);
      
      emit(VendorState.loaded(stats: currentStats!, orders: currentOrders!));
      await _loadDashboard(emit);
    }
  }

  Future<void> _fulfillOrder(String pickupCode, Emitter<VendorState> emit) async {
    final result = await confirmPickup(pickupCode);
    
    result.fold(
      (failure) => emit(VendorState.error(failure.message)),
      (_) => add(const VendorEvent.refreshData()),
    );
  }

  Future<void> _updateShopStatus(bool isOpen, Emitter<VendorState> emit) async {
    final result = await updateShopStatus(isOpen);
    
    result.fold(
      (failure) => emit(VendorState.error(failure.message)),
      (_) => add(const VendorEvent.refreshData()),
    );
  }
}
