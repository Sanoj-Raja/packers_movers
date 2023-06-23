import 'package:intl/intl.dart';
import '../../widgets/gapper.dart';
import 'package:flutter/material.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_colors.dart';
import '../../utils/get_screen_size.dart';
import '../../models/quotation_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QuotationScreen extends StatefulWidget {
  const QuotationScreen({super.key});

  @override
  State<QuotationScreen> createState() => _QuotationScreenState();
}

class _QuotationScreenState extends State<QuotationScreen> {
  late Box<QuotationModel> quotationsBox;

  @override
  void initState() async {
    quotationsBox = await Hive.openBox<QuotationModel>('quotations');
    super.initState();
  }

  @override
  void dispose() {
    Hive.box('quotations').close();
    super.dispose();
  }

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
        body: SizedBox(
          width: AppUtils.getScreenWidth(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalGap(),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.containerBackgroundWhite,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryTextGray.withOpacity(0.5),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColors.quotationContainerGray,
                    ),
                  ),
                ),
              ),
              const VerticalGap(),
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'TOTAL QUOTATIONS ',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textOrange,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ':',
                      style: TextStyle(
                        fontSize: 15,
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: ' 107',
                      style: TextStyle(
                        color: AppColors.primaryBlue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalGap(),
              Expanded(
                child: ValueListenableBuilder<Box<QuotationModel>>(
                  valueListenable: quotationsBox.listenable(),
                  builder: (context, box, _) {
                    final quotations =
                        box.values.toList().cast<QuotationModel>();
                    return quotations.isNotEmpty
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: quotations.length,
                            itemBuilder: (context, index) {
                              return QuotationCard(
                                quotation: quotations[index],
                              );
                            },
                          )
                        : const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
        horizontal: 15,
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
                Text(
                  'QUOTATIONS : #${quotation.quotationNumber}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: AppColors.containerBackgroundWhite,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const VerticalGap(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      AppAssets.profileIconImage,
                      scale: 1.8,
                    ),
                    const HorizontalGap(gap: 5),
                    Text(
                      quotation.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkTextGray,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.rupeeSymbolIconImage,
                      scale: 1.8,
                    ),
                    const HorizontalGap(gap: 5),
                    Text(
                      quotation.quotationPrice.toStringAsFixed(2),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.darkTextGray,
                      ),
                    ),
                  ],
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
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
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
                        fontSize: 19,
                        color: AppColors.darkTextGray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
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
                Column(
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
                        fontSize: 19,
                        color: AppColors.darkTextGray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1.0,
            color: AppColors.dividerGreyColor,
          ),
          const VerticalGap(),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppAssets.callIconImage,
                      scale: 1.8,
                    ),
                    const HorizontalGap(gap: 5),
                    Text(
                      quotation.phoneNumber,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.darkTextGray,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
              horizontal: 10,
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
