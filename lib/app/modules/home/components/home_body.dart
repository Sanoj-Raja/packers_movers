import 'clickable_icon.dart';
import '../../../widgets/gapper.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../utils/get_screen_size.dart';
import '../../quotations/quotations_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (_, __, ___) => Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            width: AppUtils.getScreenWidth(context) * .76,
            decoration: BoxDecoration(
              color: AppColors.transparentColor,
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage(AppAssets.carouselIconImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          options: CarouselOptions(
            height: AppUtils.getScreenHeight(context) * .18,
            aspectRatio: 2 / 1,
            initialPage: 1,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
            scrollDirection: Axis.horizontal,
          ),
        ),
        const VerticalGap(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 3),
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                color: AppColors.primaryBlue,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const VerticalGap(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Container(
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
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
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
        ),
        const VerticalGap(gap: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Container(
            width: AppUtils.getScreenWidth(context) * .8,
            padding: const EdgeInsets.fromLTRB(15, 20, 10, 30),
            decoration: BoxDecoration(
              color: AppColors.containerBackgroundWhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add Documents',
                  style: TextStyle(
                    color: AppColors.darkTextGray,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const VerticalGap(gap: 26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ClickableIcon(
                      iconImagePath: AppAssets.quotationIconImage,
                      iconName: 'Quotation',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const QuotationsScreen(),
                          ),
                        );
                      },
                    ),
                    const ClickableIcon(
                      iconImagePath: AppAssets.surveyListIconImage,
                      iconName: 'Survey List',
                    ),
                    const ClickableIcon(
                      iconImagePath: AppAssets.packingListIconImage,
                      iconName: 'Packing List',
                    ),
                    const ClickableIcon(
                      iconImagePath: AppAssets.lrBilityImage,
                      iconName: 'LR-Bility',
                    ),
                  ],
                ),
                const VerticalGap(gap: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ClickableIcon(
                      iconImagePath: AppAssets.billIconImage,
                      iconName: 'Bill',
                    ),
                    ClickableIcon(
                      iconImagePath: AppAssets.carConditionIconImage,
                      iconName: 'Car Condition',
                    ),
                    ClickableIcon(
                      iconImagePath: AppAssets.pbCardIconImage,
                      iconName: 'PB Card',
                    ),
                    ClickableIcon(
                      iconImagePath: AppAssets.moneyReciptIconImage,
                      iconName: 'Money Recipt',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: kBottomNavigationBarHeight,
        )
      ],
    );
  }
}
