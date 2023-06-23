import 'package:intl/intl.dart';
import '../../../widgets/gapper.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_assets.dart';
import '../../../constants/app_colors.dart';
import '../../../utils/get_screen_size.dart';
import '../../../models/quotation_model.dart';

class QuotationCard extends StatelessWidget {
  final QuotationModel quotation;

  const QuotationCard({
    super.key,
    required this.quotation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppUtils.getScreenWidth(context) * .85,
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerBackgroundWhite,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '1',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.containerBackgroundWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const HorizontalGap(gap: 20),
                Expanded(
                  child: Text(
                    'QUOTATIONS : #${quotation.quotationNumber}',
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.containerBackgroundWhite,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const VerticalGap(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.profileIconImage,
                        scale: 1.8,
                      ),
                      const HorizontalGap(gap: 5),
                      Expanded(
                        child: Text(
                          quotation.name,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkTextGray,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const HorizontalGap(gap: 25),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.rupeeSymbolIconImage,
                          scale: 1.8,
                        ),
                        const HorizontalGap(gap: 5),
                        Expanded(
                          child: Text(
                            quotation.quotationPrice.toStringAsFixed(2),
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.darkTextGray,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: AppColors.dividerGreyColor,
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'FROM',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryTextGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        quotation.origin,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.darkTextGray,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const HorizontalGap(gap: 20),
                Column(
                  children: [
                    Image.asset(
                      AppAssets.transportIconImage,
                      scale: 2,
                    ),
                    const VerticalGap(),
                    Row(
                      children: [
                        Image.asset(AppAssets.calendarIconImage),
                        const HorizontalGap(),
                        Text(
                          DateFormat('dd-MM-yyyy').format(quotation.date),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkTextGray,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const HorizontalGap(gap: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TO',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryTextGray,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        quotation.destination,
                        style: const TextStyle(
                          fontSize: 18,
                          color: AppColors.darkTextGray,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: AppColors.dividerGreyColor,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssets.callIconImage,
                        scale: 1.8,
                      ),
                      const HorizontalGap(gap: 5),
                      Expanded(
                        child: Text(
                          quotation.phoneNumber,
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.darkTextGray,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                const HorizontalGap(gap: 20),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.pdfIconImage,
                      scale: 1.8,
                    ),
                    const HorizontalGap(gap: 5),
                    const Text(
                      'Share PDF',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.darkTextGray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            decoration: const BoxDecoration(
              color: AppColors.quotationContainerGray,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'More Options',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.darkTextGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset(
                  AppAssets.moreOptionIconImage,
                  scale: 1.8,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
