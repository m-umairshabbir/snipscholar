import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snipscholar/core/Config/colors/colors.dart';
import 'package:snipscholar/core/bloc/visibility/visibility_bloc.dart';
import 'package:snipscholar/core/bloc/visibility/visibility_event.dart';
import 'package:snipscholar/core/bloc/visibility/visibility_state.dart';
import 'package:snipscholar/core/presentation/components/btnCustom/custom_button.dart';
import 'package:snipscholar/core/presentation/components/textField/custom_field.dart';
import 'package:snipscholar/core/presentation/screens/authenticaion/signin/signin.dart';


class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisibilityBloc(),
      child: Scaffold(
        body: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx < 0) {
              // Swipe Left to Navigate to Login Screen
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SignInScreen();
                  },
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(position: offsetAnimation, child: child);
                  },
                ),
              );
            }
          },
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: BlocBuilder<VisibilityBloc, VisibilityState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Register', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: AppColors.teal)),
                          const SizedBox(height: 20),

                          CustomTextField(controller: nameController, label: 'Full Name', icon: Icons.person),
                          const SizedBox(height: 20),

                          CustomTextField(controller: emailController, label: 'Email', icon: Icons.email),
                          const SizedBox(height: 20),

                          CustomTextField(
                            controller: passwordController,
                            label: 'Password',
                            icon: Icons.lock,
                            obscureText: state.isPasswordVisible,
                            onTapSuffix: () {
                              context.read<VisibilityBloc>().add(TogglePasswordVisibility());
                            },
                          ),
                          const SizedBox(height: 20),

                          CustomTextField(
                            controller: confirmPasswordController,
                            label: 'Confirm Password',
                            icon: Icons.lock,
                            obscureText: state.isConfirmPasswordVisible,
                            onTapSuffix: () {
                              context.read<VisibilityBloc>().add(ToggleConfirmPasswordVisibility());
                            },
                          ),
                          const SizedBox(height: 30),

                          SizedBox(
                            width: double.infinity, // Button width matches TextField width
                            child: CustomButton(
                              text: "Sign Up",
                              onPressed: () {
                                if (passwordController.text != confirmPasswordController.text) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text("Passwords do not match")),
                                  );
                                  return;
                                }
                                // TODO: Add signup logic here
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Row(
                            children: [
                              Text('Already have an account?', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: AppColors.textDark)),
                              Text('  SignIn', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,color: AppColors.teal)),
                            ],
                          ),

                        ],
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [  Color(0xffd7e8fc),AppColors.shinyTeal,AppColors.teal,AppColors.teal,],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.flutter_dash, size: 80, color: Colors.white), // Dash Icon
                        SizedBox(height: 30),
                        Icon(Icons.swipe_left, color: AppColors.teal, size: 40), // Swipe Left Icon
                        SizedBox(height: 5),
                        Text(
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
            ],
          ),
        ),
      ),
    );
  }
}
