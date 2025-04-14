import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snipscholar/core/Config/colors/colors.dart';
import 'package:snipscholar/core/Config/route/route_names.dart';
import 'package:snipscholar/core/bloc/visibility/visibility_bloc.dart';
import 'package:snipscholar/core/bloc/visibility/visibility_event.dart';
import 'package:snipscholar/core/bloc/visibility/visibility_state.dart';
import 'package:snipscholar/core/presentation/components/btnCustom/custom_button.dart';
import 'package:snipscholar/core/presentation/components/textField/custom_field.dart';
import 'package:snipscholar/core/presentation/screens/authenticaion/signin/signin.dart';
import 'package:snipscholar/core/utils/validators/custom_validators.dart';

class SignUpScreen extends StatelessWidget {
  final _formKey=GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VisibilityBloc(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
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
              Expanded(
                flex: 7,
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Form(
                    key: _formKey,
                    child: BlocBuilder<VisibilityBloc, VisibilityState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Register',
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.teal)),
                            const SizedBox(height: 20),
                            CustomTextField(
                                controller: nameController,
                                label: 'Full Name',
                                validator: Validators.validateName,
                                onChanged: (value){
                                  
                                },
                                icon: Icons.person,
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                                controller: emailController,
                                validator: Validators.validateEmail,
                                onChanged: (value){
                                    if (kDebugMode) {
                                      print(value);
                                    }
                                },
                                label: 'Email',
                                icon: Icons.email),
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: passwordController,
                              validator: Validators.validatePassword,
                              onChanged: (value){
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
                            ),
                            const SizedBox(height: 20),
                            CustomTextField(
                              onChanged: (value){
                                if (kDebugMode) {
                                  print(value);
                                }
                              },
                              controller: confirmPasswordController,
                              label: 'Confirm Password',
                              icon: Icons.lock,
                              obscureText: state.isConfirmPasswordVisible,
                    
                              validator: (value) => Validators.validateConfirmPassword(
                                value,
                                passwordController.text,
                              ),
                              onTapSuffix: () {
                                context
                                    .read<VisibilityBloc>()
                                    .add(ToggleConfirmPasswordVisibility());
                              },
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double
                                  .infinity, // Button width matches TextField width
                              child: CustomButton(
                                text: "Sign Up",
                                onPressed: () {
                                  if (kDebugMode) {
                                    print("button pressed");
                                  }
                                  if (_formKey.currentState?.validate() ?? false) {
                    
                                    // 🔥 All fields are valid
                                    // Do the signup logic here
                                    // TODO: Add signup logic here
                                    if (kDebugMode) {
                                      print ("Registering user");
                                    }
                                  }
                    
                    
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            OverflowBar(
                              spacing: 1,
                              overflowSpacing: 1,
                              alignment: MainAxisAlignment.center,
                              overflowAlignment: OverflowBarAlignment.center,
                              children: [
                                const Text('Already have an account?',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.textDark)),
                                TextButton(
                                  onPressed: (){
                                    Navigator.pushNamedAndRemoveUntil(context, RouteNames.signInScreen, (route)=>false);
                                  },
                                  child:const Text('  SignIn',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.teal)), )

                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffd7e8fc),
                        AppColors.shinyTeal,
                        AppColors.teal,
                        AppColors.teal,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.flutter_dash,
                            size: 80, color: Colors.white), // Dash Icon
                        SizedBox(height: 30),
                        Icon(Icons.swipe_left,
                            color: AppColors.teal, size: 40), // Swipe Left Icon
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
