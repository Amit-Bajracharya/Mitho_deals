import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;
  final Widget? flexibleSpace;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;
  final bool showThemeToggle;

  const AppAppBar({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.backgroundColor,
    this.foregroundColor,
    this.elevation = 0,
    this.showBackButton = true,
    this.onBackButtonPressed,
    this.flexibleSpace,
    this.bottom,
    this.toolbarHeight,
    this.showThemeToggle = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: foregroundColor ?? (isDark ? AppTheme.textLight : AppTheme.textPrimary),
              ),
            )
          : null,
      centerTitle: centerTitle,
      leading: leading ??
          (showBackButton && Navigator.of(context).canPop()
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20.sp,
                    color: foregroundColor ?? (isDark ? AppTheme.textLight : AppTheme.textPrimary),
                  ),
                  onPressed: onBackButtonPressed ?? () => Navigator.pop(context),
                )
              : null),
      actions: [
        if (showThemeToggle) ...[
          _ThemeToggleButton(foregroundColor: foregroundColor),
          SizedBox(width: 8.w),
        ],
        if (actions != null) ...actions!,
      ],
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? (isDark ? const Color(0xFF2D2D44) : AppTheme.background),
      foregroundColor: foregroundColor ?? (isDark ? AppTheme.textLight : AppTheme.textPrimary),
      elevation: elevation,
      flexibleSpace: flexibleSpace,
      bottom: bottom,
      toolbarHeight: toolbarHeight,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}

class _ThemeToggleButton extends StatelessWidget {
  final Color? foregroundColor;

  const _ThemeToggleButton({this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Theme.of(context).brightness == Brightness.dark
            ? Icons.light_mode
            : Icons.dark_mode,
        color: foregroundColor,
      ),
      onPressed: () {
        // Navigate to settings or toggle theme directly
        // This would need ThemeBloc access
      },
    );
  }
}

class AppAppBarWithGradient extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final Gradient? gradient;
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;
  final PreferredSizeWidget? bottom;
  final double? toolbarHeight;

  const AppAppBarWithGradient({
    super.key,
    this.title,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.centerTitle = true,
    this.gradient,
    this.showBackButton = true,
    this.onBackButtonPressed,
    this.bottom,
    this.toolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    final defaultGradient = LinearGradient(
      colors: [
        AppTheme.primaryOrange,
        AppTheme.primaryOrangeDark,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    return Container(
      decoration: BoxDecoration(
        gradient: gradient ?? defaultGradient,
      ),
      child: AppAppBar(
        title: title,
        actions: actions,
        leading: leading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        centerTitle: centerTitle,
        backgroundColor: Colors.transparent,
        foregroundColor: AppTheme.textLight,
        elevation: 0,
        showBackButton: showBackButton,
        onBackButtonPressed: onBackButtonPressed,
        bottom: bottom,
        toolbarHeight: toolbarHeight,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight ?? kToolbarHeight);
}
