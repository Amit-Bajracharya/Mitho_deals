import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:mitho_deals/core/theme/presentation/bloc/theme_state.dart';
import 'package:mitho_deals/shared/theme/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;
  final List<Widget>? actions;
  final String? title;
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;
  final bool centerTitle;
  final bool useAuthListener;

  const AppScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
    this.actions,
    this.title,
    this.showBackButton = true,
    this.onBackButtonPressed,
    this.centerTitle = true,
    this.useAuthListener = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      body: body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      drawer: drawer,
      endDrawer: endDrawer,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: _buildAppBar(context),
    );

    if (useAuthListener) {
      scaffold = _wrapWithAuthListener(context, scaffold);
    }

    return scaffold;
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    if (appBar != null) return appBar;

    if (title == null && actions == null && !showBackButton) return null;

    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).appBarTheme.titleTextStyle,
            )
          : null,
      centerTitle: centerTitle,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: onBackButtonPressed ?? () => Navigator.pop(context),
            )
          : null,
      actions: actions,
      elevation: 0,
    );
  }

  Widget _wrapWithAuthListener(BuildContext context, Widget child) {
    // Import AuthBloc only if needed to avoid circular dependencies
    // This is a placeholder for auth listener logic
    return child;
  }
}

class AppScaffoldWithTheme extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final PreferredSizeWidget? appBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;

  const AppScaffoldWithTheme({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.appBar,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, themeState) {
        final isDark = themeState.maybeWhen(
          orElse: () => false,
          loaded: (mode) {
            if (mode == ThemeMode.dark) return true;
            if (mode == ThemeMode.light) return false;
            return MediaQuery.of(context).platformBrightness == Brightness.dark;
          },
        );

        return AppScaffold(
          body: body,
          bottomNavigationBar: bottomNavigationBar,
          floatingActionButton: floatingActionButton,
          appBar: appBar,
          drawer: drawer,
          endDrawer: endDrawer,
          backgroundColor: backgroundColor ?? (isDark ? AppTheme.backgroundDark : AppTheme.backgroundLight),
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        );
      },
    );
  }
}
