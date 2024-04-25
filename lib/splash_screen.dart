import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/home/presentation/views/home_screen.dart';
import 'core/widgets/loading_widget.dart';
import 'features/authentication/presentation/model_views/auto_authentication_cubit/auto_authentication_cubit.dart';
import 'features/authentication/presentation/model_views/auto_authentication_cubit/auto_authentication_state.dart';
import 'features/authentication/presentation/views/authentication_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AutoAuthenticationCubit, AutoAuthenticationStates>(
        listener: (context, state) {
          if (state is AutoAuthenticationAuthenticatedState) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                HomeScreen.routeName, (route) => false);
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AuthenticationScreen.routeName, (route) => false);
          }
        },
        child: const LoadingWidget(),
      ),
    );
  }
}
