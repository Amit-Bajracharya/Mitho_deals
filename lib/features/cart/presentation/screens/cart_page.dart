import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../domain/entity/cart_item.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

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
      appBar: _buildAppBar(context),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: CircularProgressIndicator()),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (items) => _buildContent(context, items),
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $message', style: GoogleFonts.poppins(fontSize: 11.sp)),
                  SizedBox(height: 12.h),
                  ElevatedButton(
                    onPressed: () {
                      context.read<CartBloc>().add(const CartEvent.loadCart());
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                    ),
                    child: Text('Retry', style: GoogleFonts.poppins(fontSize: 12.sp)),
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
            loaded: (items) => items.isNotEmpty ? _buildCheckoutBar(context, items) : const SizedBox.shrink(),
            error: (message) => const SizedBox.shrink(),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leadingWidth: 48.w,
      leading: IconButton(
        onPressed: () => context.pop(),
        icon: Icon(Icons.arrow_back_rounded, color: Colors.black, size: 20.sp),
        padding: EdgeInsets.zero,
      ),
      title: Text(
        'My Cart',
        style: GoogleFonts.poppins(
          fontSize: 16.sp, // Title at 16sp
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      actions: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (items) => items.isNotEmpty
                  ? TextButton(
                      onPressed: () {
                        context.read<CartBloc>().add(const CartEvent.clearCart());
                      },
                      child: Text(
                        'Clear',
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFF6B35),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              orElse: () => const SizedBox.shrink(),
            );
          },
        ),
        SizedBox(width: 4.w),
      ],
    );
  }

  Widget _buildContent(BuildContext context, List<CartItem> items) {
    if (items.isEmpty) {
      return _buildEmptyState(context);
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return _buildCartItemCard(context, item);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 60.sp, color: Colors.grey[300]),
          SizedBox(height: 16.h),
          Text(
            'Your cart is empty',
            style: GoogleFonts.poppins(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Add some delicious deals!',
            style: GoogleFonts.poppins(
              fontSize: 9.sp, // Normal text at 9sp
              color: Colors.grey[400],
            ),
          ),
          SizedBox(height: 24.h),
          ElevatedButton(
            onPressed: () => context.go('/'),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B35),
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
            ),
            child: Text(
              'Browse Deals',
              style: GoogleFonts.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemCard(BuildContext context, CartItem item) {
    final currencyFormat = NumberFormat.currency(symbol: 'Rs. ', decimalDigits: 0);

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: item.imageUrl.isNotEmpty
                      ? Image.network(
                          item.imageUrl,
                          width: 60.w, // Smaller box
                          height: 60.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                                width: 60.w,
                                height: 60.w,
                                color: Colors.grey[100],
                                child: Icon(Icons.fastfood, color: Colors.grey[300], size: 24.sp),
                              ),
                        )
                      : Container(
                          width: 60.w,
                          height: 60.w,
                          color: Colors.grey[100],
                          child: Icon(Icons.fastfood, color: Colors.grey[300], size: 24.sp),
                        ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.foodName,
                        style: GoogleFonts.poppins(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF1F2937),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        item.vendorName,
                        style: GoogleFonts.poppins(
                          fontSize: 9.sp, // Normal text at 9sp
                          color: Colors.grey[500],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        currencyFormat.format(item.discountedPrice),
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFFF6B35),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => context.read<CartBloc>().add(CartEvent.removeFromCart(item.dealId)),
                  icon: Icon(Icons.delete_outline, color: Colors.red[300], size: 18.sp),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.r)),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: Colors.grey[200]!),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildQtyBtn(Icons.remove, item.quantity > 1 ? () {
                         context.read<CartBloc>().add(CartEvent.updateQuantity(item.dealId, item.quantity - 1));
                      } : null),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          '${item.quantity}',
                          style: GoogleFonts.poppins(fontSize: 11.sp, fontWeight: FontWeight.w700),
                        ),
                      ),
                      _buildQtyBtn(Icons.add, () {
                         context.read<CartBloc>().add(CartEvent.updateQuantity(item.dealId, item.quantity + 1));
                      }),
                    ],
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, size: 10.sp, color: Colors.grey[400]),
                    SizedBox(width: 4.w),
                    Text(
                      'Pickup: ${DateFormat('h:mm a').format(item.pickupStartTime)}',
                      style: GoogleFonts.poppins(fontSize: 8.sp, color: Colors.grey[500], fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyBtn(IconData icon, VoidCallback? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.w),
        child: Icon(icon, size: 14.sp, color: onTap == null ? Colors.grey[300] : const Color(0xFFFF6B35)),
      ),
    );
  }

  Widget _buildCheckoutBar(BuildContext context, List<CartItem> items) {
    final total = items.fold<double>(0, (sum, item) => sum + (item.discountedPrice * item.quantity));
    final currencyFormat = NumberFormat.currency(symbol: 'Rs. ', decimalDigits: 0);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total (${items.length} items)',
                  style: GoogleFonts.poppins(fontSize: 9.sp, color: Colors.grey[500], fontWeight: FontWeight.w500),
                ),
                Text(
                  currencyFormat.format(total),
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFFFF6B35),
                  ),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Checkout feature coming soon!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B35),
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                elevation: 0,
              ),
              child: Text(
                'Checkout',
                style: GoogleFonts.poppins(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
