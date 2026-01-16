import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/data/models/login_request_model.dart';
import 'package:crafty_bay/features/auth/ui/controllers/login_controller.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/data/models/user_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/show_snack_bar.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LoginController _loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 20,
              vertical: MediaQuery.sizeOf(context).height * 0.16,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppLogo(width: 100, height: 100),
                const SizedBox(height: 24),
                Text(
                  "Welcome Back",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  "Please Enter Your Email Address & Password",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _emailTEController,
                    decoration: InputDecoration(hintText: "Email Address"),
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
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
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordTEController,
                  decoration: InputDecoration(hintText: "Password"),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Please enter your password.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                GetBuilder<LoginController>(
                  builder: (_) {
                    return Visibility(
                      visible: _loginController.inProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _moveToHomePage,
                        child: Text("Login"),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteNames.registerScreen);
                      },
                      child: Text(
                        "Sign Up",
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

  Future<void> _moveToHomePage() async {
    if (_formKey.currentState!.validate()) {
      final LoginRequestModel model = LoginRequestModel(
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
      );
      NetworkResponse response = await _loginController.login(model);
      if (response.isSuccess) {
        showSnackBar(title: "Success", content: _loginController.message!);
        Get.find<AuthController>().saveUserData(
          response.data!['data']['token'],
          UserModel.fromJson(response.data!['data']['user']),
        );
        Get.offAllNamed(RouteNames.mainBottomNavBarScreen);
      } else {
        showSnackBar(
          title: "Failed",
          content: _loginController.errorMessage!,
          isError: true,
        );
      }
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
