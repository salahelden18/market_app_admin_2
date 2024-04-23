import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/core/widgets/loading_widget.dart';
import 'package:market_app_web_2/features/authentication/presentation/model_views/auto_authentication_cubit/auto_authentication_cubit.dart';
import 'package:market_app_web_2/features/authentication/presentation/model_views/auto_authentication_cubit/auto_authentication_state.dart';
import 'package:market_app_web_2/features/authentication/presentation/views/authentication_screen.dart';
import 'package:market_app_web_2/features/home/presentation/views/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AutoAuthenticationCubit>().authenticateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AutoAuthenticationCubit, AutoAuthenticationStates>(
        builder: (context, state) {
          if (state is AutoAuthenticationLoadingState) {
            return const LoadingWidget();
          } else if (state is AutoAuthenticationAuthenticatedState) {
            return const HomeScreen();
          } else {
            return const AuthenticationScreen();
          }
        },
      ),
    );
  }
}
