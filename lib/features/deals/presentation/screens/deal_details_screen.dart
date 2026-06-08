import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/features/cart/domain/entity/cart_item.dart';
import 'package:mitho_deals/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:mitho_deals/features/cart/presentation/bloc/cart_event.dart';
import 'package:mitho_deals/features/deals/domain/entitiy/deal_entity.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_bloc.dart';
import 'package:mitho_deals/features/deals/presentation/bloc/deals_event.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deal_details/deal_details_bottom_bar.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deal_details/deal_details_description_section.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deal_details/deal_details_header_image.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deal_details/deal_details_location_section.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deal_details/deal_details_pickup_section.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deal_details/deal_details_timer_section.dart';
import 'package:mitho_deals/features/deals/presentation/widgets/deal_details/deal_details_title_section.dart';
import 'package:mitho_deals/shared/widgets/sheets/quantity_selector_sheet.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class DealDetailsScreen extends StatefulWidget {
  final DealEntity deal;

  const DealDetailsScreen({super.key, required this.deal});

  @override
  State<DealDetailsScreen> createState() => _DealDetailsScreenState();
}

class _DealDetailsScreenState extends State<DealDetailsScreen> {
  late Timer _timer;
  Duration _timeLeft = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateTimeLeft();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => _calculateTimeLeft());
  }

  void _calculateTimeLeft() {
    final now = DateTime.now();
    if (mounted) {
      setState(() {
        _timeLeft = widget.deal.pickupEndTime.isAfter(now)
            ? widget.deal.pickupEndTime.difference(now)
            : Duration.zero;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DealDetailsHeaderImage(deal: widget.deal),
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DealDetailsTitleSection(deal: widget.deal),
                      SizedBox(height: 16.h),
                      DealDetailsTimerSection(timeLeft: _timeLeft),
                      SizedBox(height: 20.h),
                      DealDetailsDescriptionSection(description: widget.deal.description),
                      SizedBox(height: 20.h),
                      DealDetailsPickupSection(deal: widget.deal),
                      SizedBox(height: 20.h),
                      DealDetailsLocationSection(deal: widget.deal),
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
          DealDetailsBottomBar(
            deal: widget.deal,
            onAddToCart: _showAddToCartSelector,
            onReserve: _showQuantitySelector,
          ),
        ],
      ),
    );
  }

  void _showQuantitySelector() {
    QuantitySelectorSheet.show(
      context,
      title: 'Portions',
      maxQuantity: widget.deal.availablePortions,
      confirmLabel: 'Confirm',
      onConfirm: (quantity) {
        ServiceLocator.get<DealsBloc>().add(
          DealsEvent.claimDeal(dealId: widget.deal.id, quantity: quantity),
        );
        Navigator.pop(context);
      },
    );
  }

  void _showAddToCartSelector() {
    QuantitySelectorSheet.show(
      context,
      title: 'Add to Cart',
      subtitle: widget.deal.foodName,
      maxQuantity: widget.deal.availablePortions,
      confirmLabel: 'Add to Cart',
      onConfirm: (quantity) {
        final cartItem = CartItem(
          dealId: widget.deal.id,
          foodName: widget.deal.foodName,
          imageUrl: widget.deal.imageUrl,
          discountedPrice: widget.deal.discountedPrice,
          quantity: quantity,
          vendorId: widget.deal.vendorId,
          vendorName: widget.deal.vendorName,
          pickupStartTime: widget.deal.pickupStartTime,
          pickupEndTime: widget.deal.pickupEndTime,
        );
        GetIt.instance<CartBloc>().add(CartEvent.addToCart(cartItem));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const AppText.bodySmall('Added to cart!', color: Colors.white),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 2),
            action: SnackBarAction(
              label: 'View Cart',
              textColor: Colors.white,
              onPressed: () => context.push('/cart'),
            ),
          ),
        );
      },
    );
  }
}
