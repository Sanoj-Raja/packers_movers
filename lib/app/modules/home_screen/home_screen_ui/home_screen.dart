import 'package:flutter/material.dart';
import 'package:packers_movers/app/utils/get_screen_size.dart';
import 'package:packers_movers/app/widgets/gapper.dart';
import '../../../constants/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          toolbarHeight: 40,
          centerTitle: true,
          backgroundColor: AppColors.primaryBlue,
          title: const Text(
            'Nice Packers & Movers',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.notifications),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
          ],
        ),
        drawer: const Drawer(),
        body: Column(
          children: [
            Center(
              child: Container(
                height: AppUtils.getScreenHeight(context) * .18,
                width: AppUtils.getScreenWidth(context) * .65,
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const Text('Indicators'),
            const VerticalGap(),
            Container(
              width: AppUtils.getScreenWidth(context) * .8,
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
              decoration: BoxDecoration(
                color: AppColors.containerBackgroundWhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nice Packers & Movers',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const VerticalDivider(),
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            VerticalGap(gap: 8),
                            Text(
                              'User ID',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryTextGray,
                              ),
                            ),
                            VerticalGap(),
                            Text(
                              '850174597',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                            VerticalGap(gap: 8),
                            Text(
                              'Copy',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryBlue,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: AppUtils.getScreenHeight(context) * .1,
                          width: 3,
                          color: AppColors.dividerGreyColor,
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            VerticalGap(gap: 8),
                            Text(
                              'Plan',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryTextGray,
                              ),
                            ),
                            VerticalGap(),
                            Text(
                              'Silver',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),
                            VerticalGap(gap: 8),
                            Text(
                              '20 Days Left',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textBlack,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const VerticalGap(),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Text(
                          'Renew Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const VerticalGap(gap: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
