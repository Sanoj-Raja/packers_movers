import '../../widgets/gapper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../utils/get_screen_size.dart';
import '../../widgets/custom_text_field.dart';
import '../veryify_otp/verify_otp_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final signupFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: AppUtils.getScreenHeight(context) * .15,
              ),
              const Text(
                'Sign UP',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25),
                width: AppUtils.getScreenWidth(context) * .55,
                child: Image.asset(AppAssets.signupScreenImage),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 70),
                  child: Text(
                    'Mobile No.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const VerticalGap(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Form(
                  key: signupFormKey,
                  child: CustomTextField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      return (value ?? '').isEmpty
                          ? 'Enter mobile number!'
                          : value!.length == 10
                              ? int.tryParse(value) != null
                                  ? null
                                  : 'Enter a valid 10 digit mobile number!'
                              : 'Mobile number should only have 10 digits!';
                    },
                  ),
                ),
              ),
              const VerticalGap(),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 50),
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'I Agree with the ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms and Conditions',
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  debugPrint('Terms and Conditions clicked');
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const VerticalGap(),
              TextButton(
                onPressed: () {
                  if (signupFormKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyOtpScreen(),
                      ),
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'GET OTP',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppUtils.getScreenHeight(context) * .2,
              ),
              const Text(
                'Need Any Help',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const VerticalGap(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.call,
                    color: Colors.grey,
                    size: 18,
                  ),
                  HorizontalGap(),
                  Text(
                    'Call Us At +91-4234234234',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppUtils.getScreenHeight(context) * .03,
              )
            ],
          ),
        ),
      ),
    );
  }
}
