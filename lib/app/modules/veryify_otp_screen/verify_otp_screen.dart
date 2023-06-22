import 'package:flutter/material.dart';
import 'package:packers_movers/app/constants/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../constants/app_assets.dart';
import '../../utils/get_screen_size.dart';
import '../../widgets/gapper.dart';
import '../home_screen/home_screen_ui/home_screen.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppUtils.getScreenHeight(context) * .15,
            ),
            const Text(
              'Verify OTP',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 25),
              width: AppUtils.getScreenWidth(context) * .55,
              child: Image.asset(AppAssets.verifyOtpScreenImage),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const VerticalGap(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                onChanged: (value) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 55,
                  fieldWidth: 55,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: Colors.white,
                  selectedColor: Colors.white,
                  selectedFillColor: Colors.white,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                boxShadows: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: AppColors.shadowColor.withOpacity(0.25),
                    blurRadius: 5,
                  )
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 70),
                child: Text(
                  'Resend OTP in 2:00',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const VerticalGap(),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
              style: TextButton.styleFrom(
                minimumSize: const Size(170, 40),
                backgroundColor: AppColors.primaryBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: AppUtils.getScreenHeight(context) * .26,
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
    );
  }
}
