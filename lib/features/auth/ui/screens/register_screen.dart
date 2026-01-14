import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:crafty_bay/features/auth/ui/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static final String name = '/register';

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
                  "Complete Profile",
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
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _mobileTEController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(hintText: "Mobile"),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your mobile number.";
                          } else if (value.length < 8) {
                            return "Password must be at least 8 character long.";
                          } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                            return "Password must contain at least one number.";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _cityTEController,
                        textInputAction: TextInputAction.next,
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
                ElevatedButton(
                  onPressed: _onTapUserSignUp,
                  child: Text("Complete"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapUserSignUp() {
    if (_formKey.currentState!.validate()) {
      // TODO: Sign up logic
      Navigator.pushReplacementNamed(context, LoginScreen.name);
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

// {
// "first_name": "Meskatul",
// "last_name": "Islam",
// "email": "meskatcse@gmail.com",
// "password": "123456",
// "phone": "01754658781",
// "city": "Chattogram"
// }
