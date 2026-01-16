import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/data/models/sign_up_request_model.dart';
import 'package:crafty_bay/features/auth/ui/controllers/sign_up_controller.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/show_snack_bar.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final SignUpController _signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(width: 100, height: 100),
                const SizedBox(height: 24),
                Text(
                  "Join With Us",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  "Get started with us with your details",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _firstNameTEController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: "First Name"),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your first name.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _lastNameTEController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: "Last Name"),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your last name.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailTEController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(hintText: "Email Address"),
                        validator: (email) {
                          email = email?.trim();
                          if (email == null || email.isEmpty) {
                            return "Please enter your email address.";
                          }
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );
                          if (!emailRegex.hasMatch(email)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordTEController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: "Password"),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your password.";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 character long.";
                          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return "Password must contain at least one number.";
                          } else if (!RegExp(r'[a-z]').hasMatch(value)) {
                            return "Password must contain at least one character.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _mobileTEController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(hintText: "Mobile"),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your mobile number.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _cityTEController,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(hintText: "City"),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your city name.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GetBuilder<SignUpController>(
                  builder: (_) {
                    return Visibility(
                      visible: _signUpController.inProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapUserSignUp,
                        child: Text("Sign Up"),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Get.offAllNamed(RouteNames.loginScreen);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapUserSignUp() async {
    if (_formKey.currentState!.validate()) {
      final SignUpRequestModel model = SignUpRequestModel(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
        phone: _mobileTEController.text.trim(),
        city: _cityTEController.text.trim(),
      );
      final bool isSuccess = await _signUpController.signUp(model);
      if (isSuccess) {
        showSnackBar(title: "Success", content: _signUpController.message!);
        Get.toNamed(RouteNames.otpVerificationScreen, arguments: _emailTEController.text.trim());
      } else {
        showSnackBar(
          title: "Registration Failed",
          content: _signUpController.errorMessage!,
          isError: true,
        );
      }
    }
  }

  @override
  void dispose() {
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
    _mobileTEController.dispose();
    _cityTEController.dispose();
    super.dispose();
  }
}
