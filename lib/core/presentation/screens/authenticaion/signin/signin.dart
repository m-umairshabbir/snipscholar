import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snipscholar/core/Config/colors/colors.dart';
import 'package:snipscholar/core/bloc/auth/auth_bloc.dart';
import 'package:snipscholar/core/bloc/visibility/visibility_bloc.dart';
import 'package:snipscholar/core/presentation/components/btnCustom/custom_button.dart';
import 'package:snipscholar/core/presentation/components/components_barrel.dart';
import 'package:snipscholar/core/presentation/components/textField/custom_field.dart';
import 'package:snipscholar/core/presentation/screens/authenticaion/signup/signup.dart';
import 'package:snipscholar/core/utils/validators/custom_validators.dart';

import '../../../../Config/route/route_names.dart';

class SignInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.velocity.pixelsPerSecond.dx > 0) {
            // Swipe Right to Navigate to Register Screen
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return SignUpScreen();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(-1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOut;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));
                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                      position: offsetAnimation, child: child);
                },
              ),
            );
          }
        },
        child: Row(
          children: [
            // Left Side: Logo & Swipe Arrow
            Expanded(
              flex: 3,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.teal,
                      AppColors.teal,
                      AppColors.shinyTeal,
                      Color(0xffd7e8fc),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "images/tLogo.png",
                        fit: BoxFit.cover,
                        width: 80,
                        height: 80,
                      ),
                      const SizedBox(height: 30),
                      const Icon(Icons.swipe_right,
                          color: AppColors.teal,
                          size: 40), // Swipe Arrow Icon
                      const SizedBox(height: 5),
                      const Text(
                        'Swipe',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Right Side: Login Form
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child:BlocListener<AuthBloc, AuthState>(
                  listenWhen: (prev, cur) => prev.message != cur.message,
                  listener: (context, state) {
                    final success = state.authState;
                    CustomFlushBar.showCustomFlushBar(
                      context: context,
                      message: state.message,
                      icon: Icon(
                        success
                            ? Icons.check_circle_outline_rounded
                            : Icons.error_outline,
                        color: Colors.white,
                      ),
                      backgroundColor: success
                          ? Colors.teal
                          : Colors.red,
                      duration: const Duration(seconds: 3),
                    );
                  },
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Login',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: AppColors.teal)),
                        const SizedBox(height: 20),
                        CustomTextField(
                            controller: emailController,
                            validator: Validators.validateEmail,
                            onChanged: (value) {
                              if (kDebugMode) {
                                print(value);
                              }
                            },
                            label: 'Email',
                            icon: Icons.email),
                        const SizedBox(height: 20),
                        BlocBuilder<VisibilityBloc, VisibilityState>(
                          builder: (context, state) {
                            return CustomTextField(
                              controller: passwordController,
                              validator: Validators.validatePassword,
                              onChanged: (value) {
                                if (kDebugMode) {
                                  print(value);
                                }
                              },
                              label: 'Password',
                              icon: Icons.lock,
                              obscureText: state.isPasswordVisible,
                              onTapSuffix: () {
                                context
                                    .read<VisibilityBloc>()
                                    .add(TogglePasswordVisibility());
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 30),
                        BlocBuilder<AuthBloc, AuthState>(
                          builder: (context, state) {
                            return CustomButton(
                              text: state.isLoading ? "Signing..." : "SignIn",
                              onPressed: () {
                                if (kDebugMode) {
                                  print("button pressed");
                                }
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  context.read<AuthBloc>().add(
                                    LoginUserEvent(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    ),
                                  );
                                  // TODO: Add signup logic here
                                  if (kDebugMode) {
                                    print("Registering user");
                                  }
                                }
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                        OverflowBar(
                          spacing: 1,
                          overflowSpacing: 1,
                          alignment: MainAxisAlignment.center,
                          overflowAlignment: OverflowBarAlignment.center,
                          children: [
                            const Text('Don\'t have an account?',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    RouteNames.signUpScreen,
                                        (route) => false);
                              },
                              child: const Text('  SignUp',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.teal)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
