import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeVerificationScreen extends StatefulWidget {
  const PinCodeVerificationScreen({super.key});

  static final String name = "/pin-verification";

  @override
  State<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState extends State<PinCodeVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(
              horizontal: 20,
              vertical: MediaQuery.sizeOf(context).height * 0.18,
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
                  "Please Enter Your Email Address",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  cursorColor: AppColors.themeColor,
                  mainAxisAlignment: MainAxisAlignment.center,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    fieldOuterPadding: EdgeInsets.symmetric(horizontal: 10),
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    selectedColor: AppColors.themeColor,
                    inactiveFillColor: Colors.white,
                    inactiveColor: AppColors.themeColor,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24
                  ),
                  controller: _pinTEController,
                ),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: () {}, child: Text("Next")),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "This code will expire in  ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "120s",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: AppColors.themeColor,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Resend Code",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
