import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/core/services/network/network_client.dart';
import 'package:crafty_bay/features/auth/data/models/verify_otp_request_model.dart';
import 'package:crafty_bay/features/auth/ui/controllers/otp_verification_controller.dart';
import 'package:crafty_bay/features/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/features/common/data/models/user_model.dart';
import 'package:crafty_bay/features/common/ui/controllers/auth_controller.dart';
import 'package:crafty_bay/features/common/ui/widgets/centered_circular_progress_indicator.dart';
import 'package:crafty_bay/features/common/ui/widgets/show_snack_bar.dart';
import 'package:crafty_bay/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _pinTEController = TextEditingController();
  final OtpVerificationController _otpVerificationController =
      Get.find<OtpVerificationController>();

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
                  "Enter OTP Code",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  "A 4 digit OTP Code has been sent",
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
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                  controller: _pinTEController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 16),
                GetBuilder<OtpVerificationController>(
                  builder: (_) {
                    return Visibility(
                      visible: _otpVerificationController.inProgress == false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: ElevatedButton(
                        onPressed: _onTapOtpVerification,
                        child: Text("Verify"),
                      ),
                    );
                  },
                ),
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
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(
                            color: AppColors.themeColor,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                GetBuilder<OtpVerificationController>(
                  builder: (_) {
                    return Visibility(
                      visible:
                          _otpVerificationController.resendOtpInProgress ==
                          false,
                      replacement: CenteredCircularProgressIndicator(),
                      child: GestureDetector(
                        onTap: _onTapResendOtp,
                        child: Text(
                          "Resend Code",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapOtpVerification() async {
    if (_pinTEController.text.isNotEmpty) {
      final VerifyOtpRequestModel model = VerifyOtpRequestModel(
        email: widget.email,
        otp: _pinTEController.text,
      );
      NetworkResponse response = await _otpVerificationController.verifyOtp(
        model,
      );
      if (response.isSuccess) {
        showSnackBar(
          title: "Success",
          content: _otpVerificationController.message!,
        );
        Get.find<AuthController>().saveUserData(
          response.data!['data']['token'],
          UserModel.fromJson(response.data!['data']['user']),
        );
        Get.offAllNamed(RouteNames.mainBottomNavBarScreen);
      } else {
        showSnackBar(
          title: "Verification Failed",
          content: _otpVerificationController.errorMessage!,
          isError: true,
        );
      }
    }
  }

  Future<void> _onTapResendOtp() async {
    bool isSuccess = await _otpVerificationController.resendOtp(widget.email);
    if (isSuccess) {
      showSnackBar(
        title: "Success",
        content: _otpVerificationController.message!,
      );
    } else {
      showSnackBar(
        title: "Failed",
        content: _otpVerificationController.errorMessage!,
        isError: true,
      );
    }
  }

  @override
  void dispose() {
    _pinTEController.dispose();
    super.dispose();
  }
}