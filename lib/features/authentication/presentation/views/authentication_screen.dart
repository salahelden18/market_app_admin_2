import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market_app_web_2/features/authentication/data/models/authentication_request_model.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../../core/style/font_style.dart';
import '../../../../core/utils/show_toast.dart';
import '../../../../core/widgets/filled_button_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/text_form_field_widget.dart';
import '../model_views/sign_in/signin_cubit.dart';
import '../model_views/sign_in/signin_states.dart';
import '../../../home/presentation/views/home_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});
  static const String routeName = "/authenticate";

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void sigin() {
    var isValid = _formKey.currentState!.validate();

    if (isValid) {
      context.read<SiginCubit>().siginIn(AuthenticationRequestModel(
          email: emailController.text, password: passwordController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formKey,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageConstants.signinImage),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Login', style: FontStyle.size22Black600),
                      const SizedBox(height: 10),
                      const Text(
                        'Please Sign in to continue.',
                        style: FontStyle.size18Normal,
                      ),
                      const SizedBox(height: 20),
                      TextFormFieldWidget(
                        label: 'Email Address',
                        prefixIcon: Icons.email_outlined,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'email address is required';
                          } else if (!value.contains('@')) {
                            return 'Please enter valid email';
                          }

                          return null;
                        },
                        controller: emailController,
                      ),
                      const SizedBox(height: 15),
                      TextFormFieldWidget(
                        isPass: true,
                        label: 'Password',
                        prefixIcon: Icons.lock_outline,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password is required';
                          }

                          return null;
                        },
                        controller: passwordController,
                      ),
                      const SizedBox(height: 20),
                      BlocConsumer<SiginCubit, SiginStates>(
                        listener: (context, state) {
                          if (state is SiginSuccessState) {
                            showToast(
                              context: context,
                              msg: 'Signed in successfully',
                              messageType: MessageType.success,
                            );

                            Navigator.of(context).pushNamedAndRemoveUntil(
                                HomeScreen.routeName, (route) => false);
                          } else if (state is SiginFailureState) {
                            showToast(
                                context: context, msg: state.errorMessage);
                          }
                        },
                        builder: (context, state) {
                          if (state is SiginLoadingState) {
                            return const LoadingWidget();
                          }

                          return SizedBox(
                            width: double.infinity,
                            height: 45,
                            child: FilledButtonWidget(
                              onPress: sigin,
                              title: 'Sign In',
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
