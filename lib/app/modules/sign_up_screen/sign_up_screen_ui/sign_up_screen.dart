import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:packers_movers/app/constants/app_assets.dart';
import 'package:packers_movers/app/modules/veryify_otp_screen/verify_otp_screen_ui/verify_otp_screen.dart';
import 'package:packers_movers/app/utils/get_screen_size.dart';
import 'package:packers_movers/app/widgets/gapper.dart';

import '../../../constants/app_colors.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor.withOpacity(0.25),
                      blurRadius: 8.0,
                      offset: const Offset(0, 3), // shadow offset from top-left
                    ),
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                width: AppUtils.getScreenWidth(context) * .7,
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                  ),
                  keyboardType: TextInputType.number,
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
                                decoration: TextDecoration.underline,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VerifyOtpScreen(),
                    ),
                  );
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
                    'Call Us At +91',
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
