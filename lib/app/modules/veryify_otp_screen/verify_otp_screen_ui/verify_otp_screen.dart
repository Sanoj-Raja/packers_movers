import 'package:flutter/material.dart';
import '../../../constants/app_assets.dart';
import '../../../utils/get_screen_size.dart';
import '../../../widgets/gapper.dart';
import '../../home_screen/home_screen_ui/home_screen.dart';

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
              child: Image.asset(AppAssets.signupScreenImage),
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
            // const VerticalGap(),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     boxShadow: [
            //       BoxShadow(
            //         color: Colors.grey.withOpacity(0.4),
            //         spreadRadius: 2.0,
            //         blurRadius: 8.0,
            //         offset: const Offset(0, 3), // shadow offset from top-left
            //       ),
            //     ],
            //     borderRadius: BorderRadius.circular(20),
            //   ),
            //   width: AppUtils.getScreenWidth(context) * .7,
            //   child: TextFormField(
            //     decoration: const InputDecoration(
            //       border: InputBorder.none,
            //       contentPadding: EdgeInsets.symmetric(
            //         horizontal: 10,
            //         vertical: 8,
            //       ),
            //     ),
            //     keyboardType: TextInputType.number,
            //   ),
            // ),
            // const VerticalGap(),
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Container(
            //     padding: const EdgeInsets.only(left: 50),
            //     child: Row(
            //       children: [
            //         Checkbox(
            //           value: true,
            //           onChanged: (value) {},
            //         ),
            //         RichText(
            //           text: TextSpan(
            //             children: [
            //               const TextSpan(
            //                 text: 'I Agree with the ',
            //                 style: TextStyle(
            //                   color: Colors.black,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //               ),
            //               TextSpan(
            //                 text: 'Terms and Conditions',
            //                 style: const TextStyle(
            //                   color: Colors.blue,
            //                   decoration: TextDecoration.underline,
            //                   fontWeight: FontWeight.w500,
            //                 ),
            //                 recognizer: TapGestureRecognizer()
            //                   ..onTap = () {
            //                     debugPrint('Terms and Conditions clicked');
            //                   },
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
                backgroundColor: Colors.blue,
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
    );
  }
}
