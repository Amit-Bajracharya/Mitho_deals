import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';
import '../../domain/entity/cart_item.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';
import '../widgets/cart_app_bar.dart';
import '../widgets/cart_checkout_bar.dart';
import '../widgets/cart_empty_state.dart';
import '../widgets/cart_item_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<CartBloc>().add(const CartEvent.loadCart());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: const CartAppBar(),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (items) => _buildContent(items),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText.error('Error: $message'),
                  SizedBox(height: 12.h),
                  AppButton(
                    label: 'Retry',
                    size: AppButtonSize.compact,
                    width: null,
                    onPressed: () {
                      context.read<CartBloc>().add(const CartEvent.loadCart());
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const SizedBox.shrink(),
            loaded: (items) => items.isNotEmpty ? CartCheckoutBar(items: items) : const SizedBox.shrink(),
            error: (message) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  Widget _buildContent(List<CartItem> items) {
    if (items.isEmpty) {
      return const CartEmptyState();
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      itemCount: items.length,
      itemBuilder: (context, index) => CartItemCard(item: items[index]),
    );
  }
}
