import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/repositories/introduction_repository_impl.dart';
import '../bloc/introduction_bloc.dart';
import '../bloc/introduction_event.dart';
import '../widgets/introduction_view.dart';

class IntroductionPage extends StatelessWidget {
  const IntroductionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final repository = IntroductionRepositoryImpl(snapshot.data!);

        return BlocProvider(
          create: (context) => IntroductionBloc(repository)
            ..add(const IntroductionEvent.loadPages()),
          child: const IntroductionView(),
        );
      },
    );
  }
}
