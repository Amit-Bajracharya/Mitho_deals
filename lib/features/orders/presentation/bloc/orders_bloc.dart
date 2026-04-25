import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitho_deals/features/orders/domain/usecase/get_my_order_usecase.dart';
import 'orders_event.dart';
import 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetMyOrdersUseCase getMyOrdersUseCase;

  OrdersBloc({required this.getMyOrdersUseCase}) : super(const OrdersState.initial()) {
    on<LoadMyOrders>((event, emit) async {
      emit(const OrdersState.loading());
      try {
        final orders = await getMyOrdersUseCase();
        emit(OrdersState.loaded(orders));
      } catch (e) {
        emit(OrdersState.error(e.toString()));
      }
    });
  }
}
