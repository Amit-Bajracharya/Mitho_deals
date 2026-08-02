import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mitho_deals/core/dependency_injection/service_locator.dart';
import 'package:mitho_deals/core/theme/presentation/bloc/theme_bloc.dart';
import 'package:mitho_deals/core/theme/presentation/bloc/theme_event.dart';
import 'package:mitho_deals/core/theme/presentation/bloc/theme_state.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ServiceLocator.get<ThemeBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Settings',
            style: GoogleFonts.poppins(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.w),
          children: [
            _buildThemeSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSection(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Appearance',
              style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                final currentMode = state.when(
                  initial: () => ThemeMode.system,
                  loaded: (mode) => mode,
                );

                return Column(
                  children: [
                    _buildThemeOption(
                      context: context,
                      title: 'System',
                      subtitle: 'Follow device settings',
                      value: ThemeMode.system,
                      groupValue: currentMode,
                    ),
                    _buildThemeOption(
                      context: context,
                      title: 'Light',
                      subtitle: 'Always use light mode',
                      value: ThemeMode.light,
                      groupValue: currentMode,
                    ),
                    _buildThemeOption(
                      context: context,
                      title: 'Dark',
                      subtitle: 'Always use dark mode',
                      value: ThemeMode.dark,
                      groupValue: currentMode,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeOption({
    required BuildContext context,
    required String title,
    required String subtitle,
    required ThemeMode value,
    required ThemeMode groupValue,
  }) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.poppins(
          fontSize: 12.sp,
        ),
      ),
      trailing: Radio<ThemeMode>(
        value: value,
        groupValue: groupValue,
        onChanged: (ThemeMode? newValue) {
          if (newValue != null) {
            context.read<ThemeBloc>().add(ThemeEvent.updateTheme(newValue));
          }
        },
      ),
      contentPadding: EdgeInsets.zero,
      onTap: () {
        context.read<ThemeBloc>().add(ThemeEvent.updateTheme(value));
      },
    );
  }
}
