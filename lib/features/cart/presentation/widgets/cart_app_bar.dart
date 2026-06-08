import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';
import '../bloc/cart_bloc.dart';
import '../bloc/cart_event.dart';
import '../bloc/cart_state.dart';

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
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
      title: AppText.headline('My Cart', fontWeight: FontWeight.w700, color: Colors.black),
      actions: [
        BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (items) => items.isNotEmpty
                  ? AppButton(
                      label: 'Clear',
                      variant: AppButtonVariant.text,
                      onPressed: () {
                        context.read<CartBloc>().add(const CartEvent.clearCart());
                      },
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
}
