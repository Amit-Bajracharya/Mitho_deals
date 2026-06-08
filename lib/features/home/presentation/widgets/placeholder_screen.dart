import 'package:flutter/material.dart';
import 'package:mitho_deals/shared/widgets/shared_widgets.dart';

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText.body(
        '$title Screen\n(Coming Soon)',
        textAlign: TextAlign.center,
        color: Colors.grey[400],
      ),
    );
  }
}
